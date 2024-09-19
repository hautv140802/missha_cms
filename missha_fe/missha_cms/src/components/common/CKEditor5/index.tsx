import { useState, useEffect, useRef } from 'react';
import urls from '@/utils/constants/urls';
import { BASE_API_URL } from '@/utils/constants/base';
import { getAccessToken } from '@/utils/functions/getAccessToken';
import 'ckeditor5/ckeditor5.css';
import 'ckeditor5-premium-features/ckeditor5-premium-features.css';
import axiosClient from '@/libs/axios';

function createUploadAdapter(loader: any) {
  return {
    upload() {
      return loader.file.then((file: any) => {
        const formData = new FormData();
        formData.append('files', file);

        return axiosClient
          .post(urls.UPLOAD_FILES, formData)
          .then(response => {
            // Return the uploaded file's URL in the required format
            return {
              default: response.data.url, // Adjust this based on your API response
            };
          })
          .catch(error => {
            console.error('Upload error:', error);
            return Promise.reject(error);
          });
      });
    },
    abort() {
      // Handle abort if needed
    },
  };
}
function CKEditorComponent() {
  const editorToolbarRef = useRef<HTMLDivElement | null>(null);
  const [isMounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);

    return () => {
      setMounted(false);
    };
  }, []);

  return (
    <div>
      <div ref={editorToolbarRef}></div>
      <div>
        {isMounted && (
          <CKEditor
            editor={DecoupledEditor}
            data="<p>Hello from CKEditor 5 decoupled editor!</p>"
            config={{
              plugins: [
                Bold,
                Essentials,
                Italic,
                Mention,
                Paragraph,
                Undo,
                FontSize,
                EasyImage,
                Image,
                ImageUpload,
                CloudServices,
                Link,
                CKFinderUploadAdapter,
                SimpleUploadAdapter,
              ],

              toolbar: [
                'undo',
                'redo',
                '|',
                'bold',
                'italic',
                'fontSize',
                'uploadImage',
                'CKFinder',
                '',
              ],
              // ckfinder: {
              //   uploadUrl: 'http://localhost:1337/api/upload',
              //   openerMethod: 'popup',
              // },
              // extraPlugins: [(editor: any) => createUploadAdapter(editor)],
              simpleUpload: {
                uploadUrl: 'http://localhost:1337/api/upload',
                withCredentials: true,
                headers: {
                  'X-CSRF-TOKEN': 'CSRF-Token',
                  Authorization: `Bearer ${getAccessToken()}`,
                  'Content-Type': 'multipart/form-data',
                  type: 'application/json',
                  'Request Method': 'POST',
                },
              },
            }}
            onReady={editor => {
              if (editorToolbarRef.current) {
                editorToolbarRef.current.appendChild(
                  editor.ui.view.toolbar.element
                );
              }
            }}
            onChange={(event: any, editor: any) => {
              const data = editor.getData();
              console.log('Editor content was changed!', data); // Logging editor content
            }}
            onAfterDestroy={editor => {
              if (editorToolbarRef.current) {
                Array.from(editorToolbarRef.current.children).forEach(child =>
                  child.remove()
                );
              }
            }}
          />
        )}
      </div>
    </div>
  );
}

export default CKEditorComponent;
