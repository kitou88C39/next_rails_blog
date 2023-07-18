import Image from 'next/image';
import { Inter } from '@next/font/google';
import styles from './page.module.css';

//ブログを全て取得するApiを叩く(ISR)
export async function getStaticProps() {
  const res = await fetch('http://localhost:3001/api/v1/posts');
  //JSON形式で取得する
  const posts = await res.json();

  return {
    props: {
      posts,
    },
    revalidate: 60 * 60 * 24,
  };
}

const inter = Inter({ subsets: ['latin'] });

export default function Home() {
  return <></>;
}
