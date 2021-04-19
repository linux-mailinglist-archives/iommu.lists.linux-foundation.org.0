Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B41AF364DB7
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 00:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97903401C4;
	Mon, 19 Apr 2021 22:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkTUdGKffufI; Mon, 19 Apr 2021 22:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED4A40181;
	Mon, 19 Apr 2021 22:36:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD58C000B;
	Mon, 19 Apr 2021 22:36:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8733DC000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 22:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6937E40181
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 22:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHtXKJ3jnnfJ for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 22:36:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0162.hostedemail.com
 [216.40.44.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B279A401FA
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 22:36:06 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id BB77918036043
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 22:00:04 +0000 (UTC)
Received: from omf07.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id BE8CB100E7B45;
 Mon, 19 Apr 2021 22:00:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf07.hostedemail.com (Postfix) with ESMTPA id 49D5A315D7B; 
 Mon, 19 Apr 2021 22:00:00 +0000 (UTC)
Message-ID: <84e443d76c4c450770ade83aa48cc631c101d383.camel@perches.com>
Subject: Re: [PATCH v2] iommu/amd: Fix extended features logging
From: Joe Perches <joe@perches.com>
To: Alexander Monakov <amonakov@ispras.ru>
Date: Mon, 19 Apr 2021 14:59:59 -0700
In-Reply-To: <alpine.LNX.2.20.13.2104192207130.19608@monopod.intra.ispras.ru>
References: <20210411211330.2252-1-amonakov@ispras.ru>
 <0362ad3912473d24e5927c0b54ed8fd3648c68a9.camel@perches.com>
 <alpine.LNX.2.20.13.2104192207130.19608@monopod.intra.ispras.ru>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout02
X-Stat-Signature: rr8wy3tt7e6ewhrtb5agpwuwwj5up86q
X-Rspamd-Queue-Id: 49D5A315D7B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18mE84hj7FKvZFlpJsPAFtqDoE9xBfErBo=
X-HE-Tag: 1618869600-770237
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org
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

On Mon, 2021-04-19 at 22:23 +0300, Alexander Monakov wrote:
> On Sun, 11 Apr 2021, Joe Perches wrote:
> =

> > > v2: avoid pr_info(""), change pci_info() to pr_info() for a nicer
> > > solution
> > > =

> > > =A0drivers/iommu/amd/init.c | 4 ++--
> > > =A01 file changed, 2 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> > > index 596d0c413473..62913f82a21f 100644
> > > --- a/drivers/iommu/amd/init.c
> > > +++ b/drivers/iommu/amd/init.c
> > > @@ -1929,8 +1929,8 @@ static void print_iommu_info(void)
> > > =A0		pci_info(pdev, "Found IOMMU cap 0x%hx\n", iommu->cap_ptr);
> > > =A0
> > > =

> > > =A0		if (iommu->cap & (1 << IOMMU_CAP_EFR)) {
> > > -			pci_info(pdev, "Extended features (%#llx):",
> > > -				 iommu->features);
> > > +			pr_info("Extended features (%#llx):", iommu->features);
> > > +
> > > =A0			for (i =3D 0; i < ARRAY_SIZE(feat_str); ++i) {
> > > =A0				if (iommu_feature(iommu, (1ULL << i)))
> > > =A0					pr_cont(" %s", feat_str[i]);
> > =

> > How about avoiding all of this by using a temporary buffer
> > and a single pci_info.
> =

> I think it is mostly up to the maintainers, but from my perspective, it's=
 not
> good to conflate such a simple bugfix with the substantial rewrite you are
> proposing (which also increases code complexity).

You and I have _significant_ differences in the definition of substantial.

Buffering the output is the preferred code style in preference to
pr_cont.

Do remember pr_cont should _only_ be used when absolutely necessary
as interleaving of other messages from other processes/threads can
and does occur.



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
