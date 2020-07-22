Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E22298FB
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 15:10:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 83A15203BA;
	Wed, 22 Jul 2020 13:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igvBRIBhMZY4; Wed, 22 Jul 2020 13:10:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B796020425;
	Wed, 22 Jul 2020 13:10:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC64C004C;
	Wed, 22 Jul 2020 13:10:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89A26C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6B1D7876B4
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaW04SvRnHW8 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 13:10:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BAFAF87F40
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:10:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 44C622C8; Wed, 22 Jul 2020 15:10:11 +0200 (CEST)
Date: Wed, 22 Jul 2020 15:10:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
Message-ID: <20200722131009.GD27672@8bytes.org>
References: <20200720155217.274994-1-robdclark@gmail.com>
 <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Clark <robdclark@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 iommu@lists.linux-foundation.org, lkft-triage@lists.linaro.org,
 Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jul 21, 2020 at 12:45:17AM +0530, Naresh Kamboju wrote:
> On Mon, 20 Jul 2020 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The device may be torn down, but the domain should still be valid.  Lets
> > use that as the tlb flush ops cookie.
> >
> > Fixes a problem reported in [1]
> 
> This proposed fix patch applied on top of linux mainline master
> and boot test PASS on db410c.
> 
> The reported problem got fixed.

Is this needed for v5.8/stable? A fixes tag would be great too.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
