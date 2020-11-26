Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5412C50D4
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 09:59:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B86285F9D;
	Thu, 26 Nov 2020 08:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kAjQAzmUJBp; Thu, 26 Nov 2020 08:59:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEAEF85F53;
	Thu, 26 Nov 2020 08:59:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E4DCC0052;
	Thu, 26 Nov 2020 08:59:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E0BAC0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 08:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 783278764A
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 08:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYkZwSkmIaOW for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 08:59:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9FCBD87648
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 08:59:13 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BBEC20B1F;
 Thu, 26 Nov 2020 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606381153;
 bh=3Z7eRBn4dS+xir49QzOYa87bW7pn9PHPlCT+5gQc7Og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSNCdCVQz1MyuMUhKyU2c1gKbWizEfuomF+7Qezcb4C2PGrhqfIdaty8QHPV2jQrU
 5H7dE01Wxra89dScVelDQTIPKy0J6SjOvPV5vJT/sode7QxQw+QnkctQn2Iz6lrvwm
 IXbYN5r4CrtuZe4lmNuv5hRHehQvpFc6OtEGM/6E=
Date: Thu, 26 Nov 2020 08:59:08 +0000
From: Will Deacon <will@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] iommu: fix return error code in iommu_probe_device()
Message-ID: <20201126085908.GC17797@willie-the-truck>
References: <20201117025238.3425422-1-yangyingliang@huawei.com>
 <835ab066-b6b8-a211-4941-c01781031de8@linux.intel.com>
 <454f5e3e-c380-e8a5-9283-3f7578eb601e@huawei.com>
 <20201117224102.GD524@willie-the-truck>
 <78bee047-ab33-4d81-6f77-af4c5b6e8aaa@huawei.com>
 <20201125113545.GA15451@willie-the-truck>
 <9e7481f4-e55e-6c7a-dde9-62912c6e5eb4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e7481f4-e55e-6c7a-dde9-62912c6e5eb4@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Thu, Nov 26, 2020 at 10:29:57AM +0800, Yang Yingliang wrote:
> =

> On 2020/11/25 19:35, Will Deacon wrote:
> > On Wed, Nov 25, 2020 at 09:54:34AM +0800, Yang Yingliang wrote:
> > > On 2020/11/18 6:41, Will Deacon wrote:
> > > > On Tue, Nov 17, 2020 at 07:11:28PM +0800, Yang Yingliang wrote:
> > > > > On 2020/11/17 17:40, Lu Baolu wrote:
> > > > > > On 2020/11/17 10:52, Yang Yingliang wrote:
> > > > > > > If iommu_group_get() failed, it need return error code
> > > > > > > in iommu_probe_device().
> > > > > > > =

> > > > > > > Fixes: cf193888bfbd ("iommu: Move new probe_device path...")
> > > > > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > > > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > > > > > ---
> > > > > > >   =A0 drivers/iommu/iommu.c | 4 +++-
> > > > > > >   =A0 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > > > > > index b53446bb8c6b..6f4a32df90f6 100644
> > > > > > > --- a/drivers/iommu/iommu.c
> > > > > > > +++ b/drivers/iommu/iommu.c
> > > > > > > @@ -253,8 +253,10 @@ int iommu_probe_device(struct device *de=
v)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_out;
> > > > > > >   =A0 =A0=A0=A0=A0=A0 group =3D iommu_group_get(dev);
> > > > > > > -=A0=A0=A0 if (!group)
> > > > > > > +=A0=A0=A0 if (!group) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENODEV;
> > > > > > Can you please explain why you use -ENODEV here?
> > > > > Before 79659190ee97 ("iommu: Don't take group reference in
> > > > > iommu_alloc_default_domain()"), in
> > > > > =

> > > > > iommu_alloc_default_domain(), if group is NULL, it will return -E=
NODEV.
> > > > Hmm. While I think the patch is ok, I'm not sure it qualifies as a =
fix.
> > > > Has iommu_probe_device() ever propagated this error? The commit you
> > > > identify in the 'Fixes:' tag doesn't seem to change this afaict.
> > > I think after this commit 439945e74a4b ("iommu: Move default domain
> > > allocation to iommu_probe_device()"),
> > That SHA doesn't exist in my tree (maybe you mean 6e1aa2049154?). But e=
ven
> > then, I'm not sure 6e1aa2049154 is actually broken if you look at the
> > interaction with group creation in __iommu_probe_device().
> > =

> > In fact, isn't that the case in mainline too? If __iommu_probe_device()
> > returns 0, then we _know_ a group exists and so iommu_group_get() will
> > succeed. I'm still happy with the patch in case this changes in future,
> > but it doesn't appear to be fixing anything. Do you agree?
> =

> Yes, I look into the __iommu_probe_device(), if it can't get group, it wi=
ll
> return error
> =

> first.=A0 Do I need send a v2 without the fix tag ?

Yes, I think that would be fine, and perhaps update the commit message
to make it clear that this is purely cosmetic.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
