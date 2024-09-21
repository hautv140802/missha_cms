import axiosClient from '@/libs/axios';
import { BASE_URL } from '@/utils/constants/base';
import urls from '@/utils/constants/urls';
import axios from 'axios';
import { useState, useRef, useCallback } from 'react';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css';

const toolbarOptions = [
  ['bold', 'italic', 'underline', 'strike'], // toggled buttons
  ['blockquote', 'code-block'],
  ['link', 'image'],

  //   [{ header: 1 }, { header: 2 }, { header: 3 }, { header: 4 }], // custom button values
  [{ list: 'ordered' }, { list: 'bullet' }, { list: 'check' }],
  [{ script: 'sub' }, { script: 'super' }], // superscript/subscript
  [{ indent: '-1' }, { indent: '+1' }], // outdent/indent
  // [{ direction: 'rtl' }], // text direction

  //   [{ size: ['small', false, 'large', 'huge'] }], // custom dropdown
  [{ header: [1, 2, 3, 4, 5, 6, false] }],

  [{ color: [] }, { background: [] }], // dropdown with defaults from theme
  [{ font: [] }],
  [{ align: [] }],

  // ['clean'], // remove formatting button
];
const ReactQuillComponent = () => {
  const quillRef = useRef<ReactQuill>(null);
  const [value, setValue] = useState('');
  console.log(value);
  const imageHandler = useCallback(() => {
    const input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('accept', 'image/*');
    input.click();

    input.onchange = async () => {
      if (input.files !== null) {
        const file = input.files[0];
        console.log(file);

        try {
          const formData = new FormData();
          formData.append('files', file);

          const response = await axiosClient.post(urls.UPLOAD_FILES, formData, {
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          });

          const imageUrl = `${BASE_URL}${response.data[0].url}`;
          console.log(`${BASE_URL}${response.data[0].url}`);
          const editor = quillRef.current?.getEditor();
          const range = editor?.getSelection();

          // Insert the uploaded image at the cursor position
          if (range) {
            editor?.insertEmbed(range.index, 'image', imageUrl);
          }
          //   return `${BASE_API_URL}${response.data[0].url}`;
        } catch (error: any) {
          if (axios.isAxiosError(error)) {
            console.error('Error message:', error.message);
          } else {
            console.error('Unexpected error:', error);
          }
        }
      }
    };
  }, []);

  return (
    <div>
      <ReactQuill
        ref={quillRef}
        theme="snow"
        value={value}
        onChange={setValue}
        modules={{
          clipboard: {
            matchVisual: false,
          },
          toolbar: {
            container: toolbarOptions,
            handlers: {
              image: imageHandler,
            },
          },
        }}
      />
    </div>
  );
};

export default ReactQuillComponent;
