Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 129DF4D138B
	for <lists.iommu@lfdr.de>; Tue,  8 Mar 2022 10:40:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8075D60F30;
	Tue,  8 Mar 2022 09:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGxMY1CFDYhQ; Tue,  8 Mar 2022 09:40:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 43D59600CC;
	Tue,  8 Mar 2022 09:40:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 189EFC000B;
	Tue,  8 Mar 2022 09:40:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E312CC000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C387F8275A
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 09:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5o39veDjAgGW for <iommu@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 09:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A16982681
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 09:40:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e24so14507011wrc.10
 for <iommu@lists.linux-foundation.org>; Tue, 08 Mar 2022 01:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=L6CEbSPoK42XaOKUwGtERWayh0p61adsWqFpO0ze1SU=;
 b=cVwKBg1mTAg9KDP8IwOC6k1qWQNWxRFf51u6T5BJDryLB9wwMtUQE1e6DkEdY66qhX
 KBpQNBL8q/4v6RnVW4vqljITSTRbATgN+eFJN8iSq+2z3hPF+H20CMWc+zeRB2y4e1EW
 W6WDNSxvEEiQzL0RbdlEVHdyvdMW5rTyvayQGBAMunCPw+jiNFn6DXCaAp+ALfCfkG8/
 iUwWUCaYoQDxuH9UlI3CNU+Zh1CyCGYqSrr49Bnk3usZ8AO8LHwCbsgN9pTXc2H39ybA
 zCpObZkGOiRjsRxPTHNvRpoSXgpGkYi2xYRZMFGzyXg5AEpZjrmVaRG1+9ZqpIW8XC+r
 BuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L6CEbSPoK42XaOKUwGtERWayh0p61adsWqFpO0ze1SU=;
 b=vCd+AsoFnxnEVwqZkFKWrUP93DhkHLQZ4Gv/AyOkWMZsVt6LWi4wCorMzeNeWXDJ99
 u1/1ZNuvN1HAnRfxqwLDJbkEjAqQDVVTBxG6EsVOtn+ahurNDuyffqua49qEqXc9MXPj
 GSU8u4tBYQgCPl+4iNRvvKWX6FobOq4r4Qo6+Tx36uLD0308Oc6pWJW/SjHrSKrShiSx
 vsiJEL6IyCffuWXTdHkKM7EWRF7yZF3gGUGic+/CUhgPerO4iNm5P5ylLAR4HeildRuO
 jUp7ZxPFQSLQiPnstedvQl5BVxQQCgglYawhJqyId+R9uF63NrGrRHN0r3yB+o02Yn5S
 7DfQ==
X-Gm-Message-State: AOAM532HMLNp7B1690Je/oQZL51jsEsfINiRUPMqPx7Q5kd9HExmEhKT
 9Te7CN8Tf2DVOr8o8R21w9vrABejPug=
X-Google-Smtp-Source: ABdhPJyj59U21RsmDOl7SYYXgs/alHQiUGMYyi55+UhFrgl1DX1mX1s4idSDSzBtKgDuVyY9ouZYxg==
X-Received: by 2002:a5d:6c66:0:b0:1f1:f12d:442d with SMTP id
 r6-20020a5d6c66000000b001f1f12d442dmr8132734wrz.338.1646732419521; 
 Tue, 08 Mar 2022 01:40:19 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 f17-20020adffcd1000000b001edbf438d83sm13143578wrs.32.2022.03.08.01.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:40:19 -0800 (PST)
Date: Tue, 8 Mar 2022 10:40:15 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: Re: [BUG] crypto: ccree: driver does not handle case where cryptlen
 = authsize =0
Message-ID: <Yickf3IFiPiFFfTH@Red>
References: <CAOtvUMfN8U4+eG-TEVW4bSE6kOzuOSsJE4dOYGXYuWQKNzv7wQ@mail.gmail.com>
 <CAOtvUMeRb=j=NDrc88x8aB-3=D1mxZ_-aA1d4FfvJmj7Jrbi4w@mail.gmail.com>
 <YiIUXtxd44ut5uzV@Red> <YiUsWosH+MKMF7DQ@gondor.apana.org.au>
 <CAOtvUMcudG3ySU+VeE7hfneDVWGLKFTnws-xjhq4hgFYSj0qOg@mail.gmail.com>
 <YiXjCcXXk0f18FDL@Red>
 <aca4117c-b7a5-f7eb-eb03-4e1f1a93a730@arm.com>
 <YiYMeFf+Lsa9y4ss@Red>
 <CAOtvUMccCai9gFrTv6CZB-U56UtCPtmnZUyW5WmUr=+6YiUHZg@mail.gmail.com>
 <YiYPBdRIi4+HYsmW@Red>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YiYPBdRIi4+HYsmW@Red>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Le Mon, Mar 07, 2022 at 02:56:21PM +0100, Corentin Labbe a =E9crit :
> Le Mon, Mar 07, 2022 at 03:53:02PM +0200, Gilad Ben-Yossef a =E9crit :
> > On Mon, Mar 7, 2022 at 3:45 PM Corentin Labbe <clabbe.montjoie@gmail.co=
m> wrote:
> > >
> > > Le Mon, Mar 07, 2022 at 11:14:16AM +0000, Robin Murphy a =E9crit :
> > > > On 2022-03-07 10:48, Corentin Labbe wrote:
> > > > > Le Mon, Mar 07, 2022 at 09:59:29AM +0200, Gilad Ben-Yossef a =EF=
=BF=BDcrit :
> > > > >> On Sun, Mar 6, 2022 at 11:49 PM Herbert Xu <herbert@gondor.apana=
.org.au> wrote:
> > > > >>>
> > > > >>> On Fri, Mar 04, 2022 at 02:30:06PM +0100, Corentin Labbe wrote:
> > > > >>>>
> > > > >>>> Hello
> > > > >>>>
> > > > >>>> I got:
> > > > >>>> [   17.563793] ------------[ cut here ]------------
> > > > >>>> [   17.568492] DMA-API: ccree e6601000.crypto: device driver f=
rees DMA memory with different direction [device address=3D0x0000000078fe58=
00] [size=3D8 bytes] [mapped with DMA_TO_DEVICE] [unmapped with DMA_BIDIREC=
TIONAL]
> > > > >>>
> > > > >>> The direction argument during unmap must match whatever directi=
on
> > > > >>> you used during the original map call.
> > > > >>
> > > > >>
> > > > >> Yes, of course. I changed one but forgot the other.
> > > > >>
> > > > >> Corentin, could you be kind and check that this solves the origi=
nal
> > > > >> problem and does not produce new warnings?
> > > > >>
> > > > >> diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c
> > > > >> b/drivers/crypto/ccree/cc_buffer_mgr.c
> > > > >> index 11e0278c8631..31cfe014922e 100644
> > > > >> --- a/drivers/crypto/ccree/cc_buffer_mgr.c
> > > > >> +++ b/drivers/crypto/ccree/cc_buffer_mgr.c
> > > > >> @@ -356,12 +356,14 @@ void cc_unmap_cipher_request(struct device=
 *dev,
> > > > >> void *ctx,
> > > > >>                                req_ctx->mlli_params.mlli_dma_add=
r);
> > > > >>          }
> > > > >>
> > > > >> -       dma_unmap_sg(dev, src, req_ctx->in_nents, DMA_BIDIRECTIO=
NAL);
> > > > >> -       dev_dbg(dev, "Unmapped req->src=3D%pK\n", sg_virt(src));
> > > > >> -
> > > > >>          if (src !=3D dst) {
> > > > >> -               dma_unmap_sg(dev, dst, req_ctx->out_nents, DMA_B=
IDIRECTIONAL);
> > > > >> +               dma_unmap_sg(dev, src, req_ctx->in_nents, DMA_TO=
_DEVICE);
> > > > >> +               dma_unmap_sg(dev, dst, req_ctx->out_nents, DMA_F=
ROM_DEVICE);
> > > > >>                  dev_dbg(dev, "Unmapped req->dst=3D%pK\n", sg_vi=
rt(dst));
> > > > >> +               dev_dbg(dev, "Unmapped req->src=3D%pK\n", sg_vir=
t(src));
> > > > >> +       } else {
> > > > >> +               dma_unmap_sg(dev, src, req_ctx->in_nents, DMA_BI=
DIRECTIONAL);
> > > > >> +               dev_dbg(dev, "Unmapped req->src=3D%pK\n", sg_vir=
t(src));
> > > > >>          }
> > > > >>   }
> > > > >>
> > > > >> @@ -377,6 +379,7 @@ int cc_map_cipher_request(struct cc_drvdata
> > > > >> *drvdata, void *ctx,
> > > > >>          u32 dummy =3D 0;
> > > > >>          int rc =3D 0;
> > > > >>          u32 mapped_nents =3D 0;
> > > > >> +       int src_direction =3D (src !=3D dst ? DMA_TO_DEVICE : DM=
A_BIDIRECTIONAL);
> > > > >>
> > > > >>          req_ctx->dma_buf_type =3D CC_DMA_BUF_DLLI;
> > > > >>          mlli_params->curr_pool =3D NULL;
> > > > >> @@ -399,7 +402,7 @@ int cc_map_cipher_request(struct cc_drvdata
> > > > >> *drvdata, void *ctx,
> > > > >>          }
> > > > >>
> > > > >>          /* Map the src SGL */
> > > > >> -       rc =3D cc_map_sg(dev, src, nbytes, DMA_BIDIRECTIONAL, &r=
eq_ctx->in_nents,
> > > > >> +       rc =3D cc_map_sg(dev, src, nbytes, src_direction, &req_c=
tx->in_nents,
> > > > >>                         LLI_MAX_NUM_OF_DATA_ENTRIES, &dummy, &ma=
pped_nents);
> > > > >>          if (rc)
> > > > >>                  goto cipher_exit;
> > > > >> @@ -416,7 +419,7 @@ int cc_map_cipher_request(struct cc_drvdata
> > > > >> *drvdata, void *ctx,
> > > > >>                  }
> > > > >>          } else {
> > > > >>                  /* Map the dst sg */
> > > > >> -               rc =3D cc_map_sg(dev, dst, nbytes, DMA_BIDIRECTI=
ONAL,
> > > > >> +               rc =3D cc_map_sg(dev, dst, nbytes, DMA_FROM_DEVI=
CE,
> > > > >>                                 &req_ctx->out_nents, LLI_MAX_NUM=
_OF_DATA_ENTRIES,
> > > > >>                                 &dummy, &mapped_nents);
> > > > >>                  if (rc)
> > > > >>
> > > > >>
> > > > >
> > > > > Hello
> > > > >
> > > > > I still get the warning:
> > > > > [  433.406230] ------------[ cut here ]------------
> > > > > [  433.406326] DMA-API: ccree e6601000.crypto: cacheline tracking=
 EEXIST, overlapping mappings aren't supported
> > > > > [  433.406386] WARNING: CPU: 7 PID: 31074 at /home/clabbe/linux-n=
ext/kernel/dma/debug.c:571 add_dma_entry+0x1d0/0x288
> > > > > [  433.406434] Modules linked in:
> > > > > [  433.406458] CPU: 7 PID: 31074 Comm: kcapi Not tainted 5.17.0-r=
c6-next-20220303-00130-g30042e47ee47-dirty #54
> > > > > [  433.406473] Hardware name: Renesas Salvator-X board based on r=
8a77950 (DT)
> > > > > [  433.406484] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> > > > > [  433.406498] pc : add_dma_entry+0x1d0/0x288
> > > > > [  433.406510] lr : add_dma_entry+0x1d0/0x288
> > > > > [  433.406522] sp : ffff800015da3690
> > > > > [  433.406531] x29: ffff800015da3690 x28: 0000000000000000 x27: 0=
000000000000000
> > > > > [  433.406562] x26: 0000000000000000 x25: ffff80000b4c7bc0 x24: f=
fff80000b4c7000
> > > > > [  433.406593] x23: 0000000000000000 x22: 00000000ffffffef x21: f=
fff80000a9b6000
> > > > > [  433.406623] x20: ffff0004c0af5c00 x19: ffff80000b420000 x18: f=
fffffffffffffff
> > > > > [  433.406653] x17: 6c7265766f202c54 x16: 534958454520676e x15: 0=
00000000000022e
> > > > > [  433.406683] x14: ffff800015da3380 x13: 00000000ffffffea x12: f=
fff80000b4be010
> > > > > [  433.406713] x11: 0000000000000001 x10: 0000000000000001 x9 : f=
fff80000b4a6028
> > > > > [  433.406743] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : f=
fff80000b4a5fd0
> > > > > [  433.406773] x5 : ffff0006ff795c48 x4 : 0000000000000000 x3 : 0=
000000000000027
> > > > > [  433.406802] x2 : 0000000000000023 x1 : 8ca4e4fbf4b87900 x0 : 0=
000000000000000
> > > > > [  433.406833] Call trace:
> > > > > [  433.406841]  add_dma_entry+0x1d0/0x288
> > > > > [  433.406854]  debug_dma_map_sg+0x150/0x398
> > > > > [  433.406869]  __dma_map_sg_attrs+0x9c/0x108
> > > > > [  433.406889]  dma_map_sg_attrs+0x10/0x28
> > > > > [  433.406904]  cc_map_sg+0x80/0x100
> > > > > [  433.406924]  cc_map_cipher_request+0x178/0x3c8
> > > > > [  433.406939]  cc_cipher_process+0x210/0xb58
> > > > > [  433.406953]  cc_cipher_encrypt+0x2c/0x38
> > > > > [  433.406967]  crypto_skcipher_encrypt+0x44/0x78
> > > > > [  433.406986]  skcipher_recvmsg+0x36c/0x420
> > > > > [  433.407003]  ____sys_recvmsg+0x90/0x280
> > > > > [  433.407024]  ___sys_recvmsg+0x88/0xd0
> > > > > [  433.407038]  __sys_recvmsg+0x6c/0xd0
> > > > > [  433.407049]  __arm64_sys_recvmsg+0x24/0x30
> > > > > [  433.407061]  invoke_syscall+0x44/0x100
> > > > > [  433.407082]  el0_svc_common.constprop.3+0x90/0x120
> > > > > [  433.407096]  do_el0_svc+0x24/0x88
> > > > > [  433.407110]  el0_svc+0x4c/0x100
> > > > > [  433.407131]  el0t_64_sync_handler+0x90/0xb8
> > > > > [  433.407145]  el0t_64_sync+0x170/0x174
> > > > > [  433.407160] irq event stamp: 5624
> > > > > [  433.407168] hardirqs last  enabled at (5623): [<ffff80000812f6=
a8>] __up_console_sem+0x60/0x98
> > > > > [  433.407191] hardirqs last disabled at (5624): [<ffff800009c9a0=
60>] el1_dbg+0x28/0x90
> > > > > [  433.407208] softirqs last  enabled at (5570): [<ffff8000097e62=
f8>] lock_sock_nested+0x80/0xa0
> > > > > [  433.407226] softirqs last disabled at (5568): [<ffff8000097e62=
d8>] lock_sock_nested+0x60/0xa0
> > > > > [  433.407241] ---[ end trace 0000000000000000 ]---
> > > > > [  433.407381] DMA-API: Mapped at:
> > > > > [  433.407396]  debug_dma_map_sg+0x16c/0x398
> > > > > [  433.407416]  __dma_map_sg_attrs+0x9c/0x108
> > > > > [  433.407436]  dma_map_sg_attrs+0x10/0x28
> > > > > [  433.407455]  cc_map_sg+0x80/0x100
> > > > > [  433.407475]  cc_map_cipher_request+0x178/0x3c8
> > > > >
> > > > >
> > > > > BUT I start to thing this is a bug in DMA-API debug.
> > > > >
> > > > >
> > > > > My sun8i-ss driver hit the same warning:
> > > > > [  142.458351] WARNING: CPU: 1 PID: 90 at kernel/dma/debug.c:597 =
add_dma_entry+0x2ec/0x4cc
> > > > > [  142.458429] DMA-API: sun8i-ss 1c15000.crypto: cacheline tracki=
ng EEXIST, overlapping mappings aren't supported
> > > > > [  142.458455] Modules linked in: ccm algif_aead xts cmac
> > > > > [  142.458563] CPU: 1 PID: 90 Comm: 1c15000.crypto- Not tainted 5=
.17.0-rc6-next-20220307-00132-g39dad568d20a-dirty #223
> > > > > [  142.458581] Hardware name: Allwinner A83t board
> > > > > [  142.458596]  unwind_backtrace from show_stack+0x10/0x14
> > > > > [  142.458627]  show_stack from 0xf0abdd1c
> > > > > [  142.458646] irq event stamp: 31747
> > > > > [  142.458660] hardirqs last  enabled at (31753): [<c019316c>] __=
up_console_sem+0x50/0x60
> > > > > [  142.458688] hardirqs last disabled at (31758): [<c0193158>] __=
up_console_sem+0x3c/0x60
> > > > > [  142.458710] softirqs last  enabled at (31600): [<c06990c8>] su=
n8i_ss_handle_cipher_request+0x300/0x8b8
> > > > > [  142.458738] softirqs last disabled at (31580): [<c06990c8>] su=
n8i_ss_handle_cipher_request+0x300/0x8b8
> > > > > [  142.458758] ---[ end trace 0000000000000000 ]---
> > > > > [  142.458771] DMA-API: Mapped at:
> > > > >
> > > > > Yes the mapped at is empty just after.
> > > > >
> > > > > And the sequence of DMA operations in my driver is simple, so I c=
annot see how any overlap could occur.
> > > >
> > > > The "overlap" is in the sense of having more than one mapping withi=
n the
> > > > same cacheline:
> > > >
> > > > [  142.458120] DMA-API: add_dma_entry start P=3Dba79f200 N=3Dba79f
> > > > D=3Dba79f200 L=3D10 DMA_FROM_DEVICE attrs=3D0
> > > > [  142.458156] DMA-API: add_dma_entry start P=3D445dc010 N=3D445dc
> > > > D=3D445dc010 L=3D10 DMA_TO_DEVICE attrs=3D0
> > > > [  142.458178] sun8i-ss 1c15000.crypto: SRC 0/1/1 445dc000 len=3D16=
 bi=3D0
> > > > [  142.458215] sun8i-ss 1c15000.crypto: DST 0/1/1 ba79f200 len=3D16=
 bi=3D0
> > > > [  142.458234] DMA-API: add_dma_entry start P=3Dba79f210 N=3Dba79f
> > > > D=3Dba79f210 L=3D10 DMA_FROM_DEVICE attrs=3D0
> > > >
> > > > This actually illustrates exactly the reason why this is unsupporta=
ble.
> > > > ba79f200 is mapped for DMA_FROM_DEVICE, therefore subsequently mapp=
ing
> > > > ba79f210 for DMA_TO_DEVICE may cause the cacheline covering the ran=
ge
> > > > ba79f200-ba79f23f to be written back over the top of data that the
> > > > device has already started to write to memory. Hello data corruptio=
n.
> > > >
> > > > Separate DMA mappings should be from separate memory allocations,
> > > > respecting ARCH_DMA_MINALIGN.
> > > >
> > >
> > > I just saw something strange, only one SG is involved, and I dont see=
 any DMA_TO_DEVICE for ba79f210.
> > > I see 2 DMA_FROM_DEVICE (ba79f200 and ba79f210), but only one should =
be done.
> > > Why 2 FROM mappings are added with only one sg ?
> > >
> > =

> > The thing that does the memory allocation of user calls from libkcapi
> > tests is the crypto/af_alg.c code ...
> > =

> > I assume the sglist has two buffers? could it be that somehow they are
> > not DMA aligned? that would be weird indeed...
> > =

> =

> The SGlist has only one SG, so only one buffer, it is why I dont understa=
nd the double call to add_dma_entry().


Answering myself, the driver can handle 2 requests in parallel, this is the=
 reason of 2 dma call.
And both are using the same key, and so first DMA call (for the key) give s=
ame address.

This is something hard to prevent at driver level.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
