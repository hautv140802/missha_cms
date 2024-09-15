import { convertToHTML } from 'draft-convert';
import { convertToRaw, EditorState } from 'draft-js';
import { Editor } from 'react-draft-wysiwyg';
import { useState } from 'react';

const Home = () => {
  const [editorState, setEditorState] = useState(EditorState.createEmpty());
  const [htmlContent, setHtmlContent] = useState<string>('');
  const onEditorStateChange = (state: EditorState) => {
    console.log(state);
    setEditorState(state);
    const contentState = state.getCurrentContent();
    const rawContent = convertToRaw(contentState);

    // Optional: Convert raw content to HTML if needed
    const htmlContent = convertToHTML(contentState);
    setHtmlContent(htmlContent);
    // Log raw content and HTML content to console
    console.log('Raw Content State:', rawContent);
    console.log('HTML Content:', htmlContent);
  };
  return (
    <div className="editor-wrapper">
      <Editor
        editorState={editorState}
        onEditorStateChange={onEditorStateChange}
        wrapperClassName="editor-wrapper-class"
        editorClassName="editor-class"
        toolbarClassName="toolbar-class"
        // toolbar={TOOL_EDITOR}
      />
    </div>
  );
};

export default Home;
