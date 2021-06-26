Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 201163B58E4
	for <lists.iommu@lfdr.de>; Mon, 28 Jun 2021 08:00:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94EB782FE4;
	Mon, 28 Jun 2021 06:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWbooVglbfjO; Mon, 28 Jun 2021 06:00:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C623A82FD7;
	Mon, 28 Jun 2021 06:00:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1CCDC000E;
	Mon, 28 Jun 2021 06:00:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEA6FC000E
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0C2482605
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04Xbmx4CO0Lc for <iommu@lists.linux-foundation.org>;
 Sat, 26 Jun 2021 18:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BDBC825E8
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 18:17:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o35-20020a05600c5123b02901e6a7a3266cso5590146wms.1
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kota.moe; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6SbdIom3zgio+kZ6wfwDJH7rKPEfDAGy8TdscQ1Fts=;
 b=c6cU2RJcxB9treX5hi/OxkWRplBi7U9CErc1rc4z3B1uzmoMpEqqGdlY+LWXH7N5DH
 swjMX20G2YEJmG9iZ0b09BNw848w7hUZj3VyKZo8AeSMYihuCF9ZM4RA8CLuF49SbKAB
 HUiQgKLP2q3MpTKaB6Fp+44UVWbd9koTN5U9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6SbdIom3zgio+kZ6wfwDJH7rKPEfDAGy8TdscQ1Fts=;
 b=Y6ivB6anICy00EJvQqNDY+2x7hXQG6UoeiHEGr1+vgNVyI52IrqQ/GgBgrSnw7JSHG
 1MvjBrkdIfb6EwlRwBaBmpC3bB13rSXrHYaOu/KHczm50HGI7AUfp2SgYof0cYmLwVPC
 JZOsvvmV6+EXpJKn90JJyvERLCk76im8Nr4TESfUYEYFL61gT9HGSWvV8iIl+TgpgOxi
 YC56h8pWbZqq/En0/ZkkxdERfNCkmKVrNzxbyYGrmuA7JoVer8O9kqM3+2ENF0fC3VsA
 koPvSDunTEhWt8GsAxuNJd2hLZXfQW2iHWWvL/MjsElPIyQjZdY7ndbIp3RaOmKRL5v3
 dHVQ==
X-Gm-Message-State: AOAM5321B7tWlty/jP0Eetpxn6HkQ86BlOHXPVtalsB0vRxuXz34pd/p
 v2lGdsqMT0biy6gHxlFmDl38l+92llqiw76bu7rncA==
X-Google-Smtp-Source: ABdhPJxOEjtV4xly2hQKRSYOj/QdYtY37Z1yVHzjvMk45DdusPTcP6PcPe1UsAYNko+U8dIogiNwPfBjWQkq7A0F3CY=
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr17569753wmh.104.1624731459793; 
 Sat, 26 Jun 2021 11:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <YMWl4UnFBAVRDnys@eldamar.lan>
 <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
 <2f7c7d36-b6f4-f8ab-756e-a563fa03b9e4@arm.com> <YNOCXe1cuNDNAB+Z@eldamar.lan>
In-Reply-To: <YNOCXe1cuNDNAB+Z@eldamar.lan>
From: =?UTF-8?B?4oCN5bCP5aSq?= <nospam@kota.moe>
Date: Sun, 27 Jun 2021 04:17:03 +1000
Message-ID: <CACsxjPZEMbxjiRQit7yaykL8LwHFdCg53ObCfTCdRLYV_-_Few@mail.gmail.com>
Subject: Re: Bug#989778: Regression in at least 5.10.y and mainline: Firewire
 audio interface fails to work properly (when booted under Xen)
To: Salvatore Bonaccorso <carnil@debian.org>
X-Mailman-Approved-At: Mon, 28 Jun 2021 06:00:28 +0000
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-kernel@vger.kernel.org, 989778-maintonly@bugs.debian.org,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Jianxiong Gao <jxgao@google.com>
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
Content-Type: multipart/mixed; boundary="===============1134603870334167146=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============1134603870334167146==
Content-Type: multipart/alternative; boundary="00000000000084412605c5af4556"

--00000000000084412605c5af4556
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jun 2021 at 04:50, Salvatore Bonaccorso <carnil@debian.org>
wrote:

> Hi Robin,
>
> On Mon, Jun 14, 2021 at 02:29:08PM +0100, Robin Murphy wrote:
> > On 2021-06-13 07:29, Salvatore Bonaccorso wrote:
> > > A user in Debian reported the above issue, which was reproducible with
> > > 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a6875ca9
> > > ("swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single") that
> > > introduced the issue.
> >
> > Sounds like it's probably the same thing as being discussed over here:
> >
> >
> https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/
>
> Thanks for the pointer, it seems that now it has been fixed upstream
> with 5f89468e2f06 ("swiotlb: manipulate orig_addr when tlb_addr has
> offset").
>

I've checked out upstream v5.13 b7050b242430f3170e0b57f5f55136e44cb8dc66
(which includes the above commit) and confirmed that my issue is now
resolved.
Now to wait for it to reach Debian :)

--00000000000084412605c5af4556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 24 Jun 2021 at 04:50, Salvatore Bonaccorso &lt;<a href=3D"ma=
ilto:carnil@debian.org">carnil@debian.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Robin,<br>
<br>
On Mon, Jun 14, 2021 at 02:29:08PM +0100, Robin Murphy wrote:<br>
&gt; On 2021-06-13 07:29, Salvatore Bonaccorso wrote:<br>
&gt; &gt; A user in Debian reported the above issue, which was reproducible=
 with<br>
&gt; &gt; 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a687=
5ca9<br>
&gt; &gt; (&quot;swiotlb: don&#39;t modify orig_addr in swiotlb_tbl_sync_si=
ngle&quot;) that<br>
&gt; &gt; introduced the issue.<br>
&gt; <br>
&gt; Sounds like it&#39;s probably the same thing as being discussed over h=
ere:<br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6=
-09fb8949d2fd@nxp.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/</a><br>
<br>
Thanks for the pointer, it seems that now it has been fixed upstream<br>
with 5f89468e2f06 (&quot;swiotlb: manipulate orig_addr when tlb_addr has<br=
>
offset&quot;).<br></blockquote><div><br></div><div>I&#39;ve checked out ups=
tream v5.13 b7050b242430f3170e0b57f5f55136e44cb8dc66 (which includes the ab=
ove commit) and confirmed that my issue is now resolved. <br></div><div>Now=
 to wait for it to reach Debian :)<br></div></div></div>

--00000000000084412605c5af4556--

--===============1134603870334167146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1134603870334167146==--
