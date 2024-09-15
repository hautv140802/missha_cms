import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { useState, useEffect } from 'react';
import { Bold, Essentials, Italic, Mention, Paragraph, Undo } from 'ckeditor5';
function CKEditorComponent() {
  const [editorValue, setEditorValue] = useState<string>('');

  //   useEffect(() => {
  //     // Lấy đối tượng trình soạn thảo từ CKEditor và cập nhật dữ liệu của nó
  //     const editor = document.querySelector(
  //       '.ck-editor__editable'
  //     )?.editorInstance;
  //     if (editor) {
  //       editor.setData(editorValue);
  //     }
  //   }, [editorValue]);

  return (
    <CKEditor
      editor={ClassicEditor}
      config={{
        toolbar: ['heading', 'undo', 'redo', '|', 'bold', 'italic'],
        plugins: [Bold, Essentials, Italic, Mention, Paragraph, Undo],
      }}
      data={editorValue}
      onChange={(event, editor) => {
        const data = editor.getData();
        setEditorValue(data);
      }}
    />
  );
}

export default CKEditorComponent;
