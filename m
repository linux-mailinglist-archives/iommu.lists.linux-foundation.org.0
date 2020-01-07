Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3D132A48
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 16:44:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F5DA85143;
	Tue,  7 Jan 2020 15:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSjKi-aFKW4Y; Tue,  7 Jan 2020 15:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E56E8513B;
	Tue,  7 Jan 2020 15:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23342C0881;
	Tue,  7 Jan 2020 15:44:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91070C0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 15:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8456985456
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 15:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w07fTuvf07DM for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 15:44:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 40C908461B
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 15:44:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5DF506A3; Tue,  7 Jan 2020 16:44:31 +0100 (CET)
Date: Tue, 7 Jan 2020 16:44:29 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200107154429.GE30750@8bytes.org>
References: <20200101033949.755-1-masneyb@onstation.org>
 <20200107132530.GC30750@8bytes.org>
 <20200107140013.GA9084@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107140013.GA9084@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Jan 07, 2020 at 09:00:14AM -0500, Brian Masney wrote:
> On Tue, Jan 07, 2020 at 02:25:30PM +0100, Joerg Roedel wrote:
> > On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
> > >  drivers/iommu/qcom_iommu.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > Shortened commit-message a bit and applied for v5.5, thanks.
> 
> You might want to hold off on applying this since it looks like Robin
> Murphy has a better fix.
> 
> https://lore.kernel.org/lkml/fc055443-8716-4a0e-b4d5-311517d71ea0@arm.com/

Alright, thanks for the heads-up. I dropped that patch from my fixes
branch.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
