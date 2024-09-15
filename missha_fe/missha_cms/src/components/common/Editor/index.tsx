import TOOL_EDITOR from '@/utils/constants/editor';
import clsx from 'clsx';
import { convertToHTML } from 'draft-convert';
import {
  convertFromRaw,
  convertToRaw,
  EditorState,
  RawDraftContentState,
} from 'draft-js';
import { stateToHTML } from 'draft-js-export-html';
import { useEffect, useRef, useState } from 'react';
import { Editor, EditorProps } from 'react-draft-wysiwyg';

interface IEditComponentProps extends EditorProps {
  wrapperClassName?: string;
  currentEditValue?: string;
  onSetRawContent?: (content?: string) => void;
}
const EditorComponent = (props: IEditComponentProps) => {
  const { wrapperClassName, currentEditValue, onSetRawContent, ...rest } =
    props;
  const [editorState, setEditorState] = useState<EditorState>(
    EditorState.createEmpty()
  );
  const editorRef = useRef<HTMLDivElement | null>(null);
  useEffect(() => {
    if (editorRef.current) {
      // Create a MutationObserver to watch for changes in the DOM
      const observer = new MutationObserver(mutationsList => {
        // Check if the editor has been added to the DOM
        if (
          editorRef.current &&
          editorRef.current.contains(mutationsList[0].target)
        ) {
          // Perform actions here when the element is added to the DOM
          console.log('Editor has been added to the DOM');

          // Example: Update state or perform other actions
          setEditorState(prevState => {
            // Perform state updates as needed
            return prevState;
          });

          // Disconnect the observer if you no longer need it
          observer.disconnect();
        }
      });

      // Start observing the document
      observer.observe(document.body, { childList: true, subtree: true });

      // Cleanup the observer on unmount
      return () => {
        observer.disconnect();
      };
    }
  }, [editorRef.current]);
  console.log('EditorComponent', editorState);
  const [htmlContent, setHtmlContent] = useState<string>('');
  //   const [rawContent, setRawContent] = useState<RawDraftContentState>();
  const onEditorStateChange = (state: EditorState) => {
    console.log(state);
    setEditorState(state);
    const contentState = state.getCurrentContent();
    const rawContent = convertToRaw(contentState);

    // Optional: Convert raw content to HTML if needed
    const htmlContent = convertToHTML(contentState);
    // setHtmlContent(htmlContent);
    onSetRawContent?.(htmlContent);
    // setRawContent(rawContent);
    // Log raw content and HTML content to console
    console.log('Raw Content State:', rawContent);
    console.log('HTML Content:', htmlContent);
  };
  return (
    <div className={clsx('editor-wrapper')} ref={editorRef}>
      <Editor
        editorState={editorState}
        onEditorStateChange={onEditorStateChange}
        wrapperClassName="editor-wrapper-class"
        editorClassName="editor-class"
        toolbarClassName="toolbar-class"
        toolbar={TOOL_EDITOR}
        {...rest}
      />
    </div>
  );
};

export default EditorComponent;
