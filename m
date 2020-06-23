Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B12053FF
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 15:57:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 34CE388670;
	Tue, 23 Jun 2020 13:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWWu1bDCgzvU; Tue, 23 Jun 2020 13:57:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 672DE88665;
	Tue, 23 Jun 2020 13:57:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F22DC016F;
	Tue, 23 Jun 2020 13:57:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 885AAC016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7726789290
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nm25De+h2rXX for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 76CAA88D24
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 13:57:28 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n6so16688814otl.0
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MyZ+D4WjGVXIEhx6Ud4JlAkQ9ClE2+No4ak5dsgnsyk=;
 b=Jb6FQdzP6MRo8nqWmBhEDpmioudCjpw655DD7PXjBvifVgQA4jTFjwdDigvWRBBLL/
 w5K+S7gEa/oVJGWTY+9qOllwHzqh8Md8rjF7QXcFK+qePWncJhCBL/GbTy1aWvtb/kwj
 EKeZkUv5ywb+Jw9MfwabliM8MLM8n4vhENIXf6QSU+ws9WrOfg3Pq6+nEI/Mi9nIc9n0
 pXh8ckvVGSSpnMLPnJm/ZD6mM/4rPH3ko1z1s7V4sP+hhhCF3s2mNAxWMk8/hVG0Exh0
 kgpR8gWccWxEocUG1kNjJ/TgrWj6Rb9ZgwC6l2sMcyyYy/t2j7V0PoVLmvtltDqOTCrc
 HeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MyZ+D4WjGVXIEhx6Ud4JlAkQ9ClE2+No4ak5dsgnsyk=;
 b=aShB788W0drsPVHCAi8+HL0JkS7yDnIXOPikcL/WYAaX86/Fq5mQLpsTxYarXCNwwt
 JVNMAombEyHtAOHZEZVi+NtSp7dtkwUEF9MUREnRKiHHaAsZeIqDMfbEL0dEuNuTHNwJ
 t5fkCYKu8F96Sdrn85haLJMJiLTT9qU89Dp26tQhq+DefwlQjuqk8rLzFFYx64JXSelN
 GbgH5Ynog/oqYRFQMgJNf1/NdsQneYuZsdKggcbEMwcDJBgU5zHuhcLrn0RnxbY1HHxG
 iU/VEQaKW7UKf4CV40I4iYo7NCGp4YVmWYK+/tmftai/ZgFkdnjhqeaO9B28M97JDcBz
 dW2g==
X-Gm-Message-State: AOAM533l+qxMluZJv8cs9bYEcjSeX3hMn1sXpj34YxDGs62k9yr77wf+
 xW7qmY9294Snn9AmLj/CCEIUz7ybN+z7mtDsx5A=
X-Google-Smtp-Source: ABdhPJw/X4xsmWK4i7mZ4d3Xl8oR1+ANKCGAZVW3l8wF9bUhUFARtjvTpiiW1h32A3zgAEJVVi2UPqakB0AepdLLBTc=
X-Received: by 2002:a9d:4507:: with SMTP id w7mr18092308ote.335.1592920647723; 
 Tue, 23 Jun 2020 06:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <1592846920-45338-5-git-send-email-john.garry@huawei.com>
 <202006230905.3HpPgtSC%lkp@intel.com>
 <5ba2e240-b324-d316-c00c-38c03ee49baa@huawei.com>
 <CADRDgG4=uD3Ni6r7D3kHdSo=ketaXKGririHfFvPYq4qz8KjfQ@mail.gmail.com>
 <ee2d7a1e-3e22-f25a-ced9-82ccced28f8c@huawei.com>
In-Reply-To: <ee2d7a1e-3e22-f25a-ced9-82ccced28f8c@huawei.com>
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Tue, 23 Jun 2020 15:55:31 +0200
Message-ID: <CADRDgG5pOstGK=fm8s3Be_v8+vc-EyRYmpiMsTCeK-rMk2ZRQQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] iommu/arm-smmu-v3: Remove cmpxchg() in
 arm_smmu_cmdq_issue_cmdlist()
To: John Garry <john.garry@huawei.com>
Cc: "trivial@kernel.org" <trivial@kernel.org>,
 kernel test robot <lkp@intel.com>, will@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
Content-Type: multipart/mixed; boundary="===============5233520383455172446=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============5233520383455172446==
Content-Type: multipart/alternative; boundary="0000000000005cef7005a8c0bd30"

--0000000000005cef7005a8c0bd30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tis 23 juni 2020 12:21John Garry <john.garry@huawei.com> skrev:

> On 23/06/2020 10:35, Rikard Falkeborn wrote:
> >
> >     I'd say that GENMASK_INPUT_CHECK() should be able to handle a l=3D0=
 and
> >     h=3Dunsigned value, so I doubt this warn.
> >
> >     Using GENMASK((int)cmdq->q.llq.max_n_shift, 0) resolves it, but it
> >     looks
> >     like GENMASK_INPUT_CHECK() could be improved.
> >
> >
> > Indeed it could, it is fixed in -next.
>
> ok, thanks for the pointer, but I still see this on today's -next with
> this patch:
>
> make W=3D1 drivers/iommu/arm-smmu-v3.o
>
>
Oh, ok thanks for reporting. I guess different gcc versions have different
behaviour. I guess we'll have to change the comparison to (!((h) =3D=3D (l)=
 ||
(h) > (l))) instead (not sure I got all parenthesis and logic correct but
you get the idea).

I'm travelling and wont have time to look at this until next week though.

Rikard



In file included from ./include/linux/bits.h:23:0,
>                  from ./include/linux/ioport.h:15,
>                  from ./include/linux/acpi.h:12,
>                  from drivers/iommu/arm-smmu-v3.c:12:
> drivers/iommu/arm-smmu-v3.c: In function =E2=80=98arm_smmu_cmdq_issue_cmd=
list=E2=80=99:
> ./include/linux/bits.h:27:7: warning: comparison of unsigned expression
> < 0 is always false [-Wtype-limits]
>    (l) > (h), 0)))
>        ^
> ./include/linux/build_bug.h:16:62: note: in definition of macro
> =E2=80=98BUILD_BUG_ON_ZERO=E2=80=99
> #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>                                                               ^
> ./include/linux/bits.h:40:3: note: in expansion of macro
> =E2=80=98GENMASK_INPUT_CHECK=E2=80=99
>   (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>    ^~~~~~~~~~~~~~~~~~~
> drivers/iommu/arm-smmu-v3.c:1404:18: note: in expansion of macro =E2=80=
=98GENMASK=E2=80=99
>   u32 prod_mask =3D GENMASK(cmdq->q.llq.max_n_shift, 0);
>
> That's gcc 7.5.0 .
>
> Cheers,
> John
>
>

--0000000000005cef7005a8c0bd30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Den tis 23 juni 2020 12:21John Garry &lt;<a href=3D"ma=
ilto:john.garry@huawei.com">john.garry@huawei.com</a>&gt; skrev:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On 23/06/2020 10:35, Rikard Falkeborn wrote:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;d say that GENMASK_INPUT_CHECK() should be ab=
le to handle a l=3D0 and<br>
&gt;=C2=A0 =C2=A0 =C2=A0h=3Dunsigned value, so I doubt this warn.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Using GENMASK((int)cmdq-&gt;q.llq.max_n_shift, 0) r=
esolves it, but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0looks<br>
&gt;=C2=A0 =C2=A0 =C2=A0like GENMASK_INPUT_CHECK() could be improved.<br>
&gt; <br>
&gt; <br>
&gt; Indeed it could, it is fixed in -next.<br>
<br>
ok, thanks for the pointer, but I still see this on today&#39;s -next with =
<br>
this patch:<br>
<br>
make W=3D1 drivers/iommu/arm-smmu-v3.o<br><br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Oh, ok thanks for reporting. I gu=
ess different gcc versions have different behaviour. I guess we&#39;ll have=
 to change the comparison to (!((h) =3D=3D (l) || (h) &gt; (l))) instead (n=
ot sure I got all parenthesis and logic correct but you get the idea).</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m travelling and wont =
have time to look at this until next week though.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Rikard</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In=
 file included from ./include/linux/bits.h:23:0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./includ=
e/linux/ioport.h:15,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./includ=
e/linux/acpi.h:12,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from drivers/=
iommu/arm-smmu-v3.c:12:<br>
drivers/iommu/arm-smmu-v3.c: In function =E2=80=98arm_smmu_cmdq_issue_cmdli=
st=E2=80=99:<br>
./include/linux/bits.h:27:7: warning: comparison of unsigned expression <br=
>
&lt; 0 is always false [-Wtype-limits]<br>
=C2=A0 =C2=A0(l) &gt; (h), 0)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
./include/linux/build_bug.h:16:62: note: in definition of macro <br>
=E2=80=98BUILD_BUG_ON_ZERO=E2=80=99<br>
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
./include/linux/bits.h:40:3: note: in expansion of macro <br>
=E2=80=98GENMASK_INPUT_CHECK=E2=80=99<br>
=C2=A0 (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))<br>
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~<br>
drivers/iommu/arm-smmu-v3.c:1404:18: note: in expansion of macro =E2=80=98G=
ENMASK=E2=80=99<br>
=C2=A0 u32 prod_mask =3D GENMASK(cmdq-&gt;q.llq.max_n_shift, 0);<br>
<br>
That&#39;s gcc 7.5.0 .<br>
<br>
Cheers,<br>
John<br>
<br>
</blockquote></div></div></div>

--0000000000005cef7005a8c0bd30--

--===============5233520383455172446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5233520383455172446==--
