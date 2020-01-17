Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 27628140743
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 11:03:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC96E86E32;
	Fri, 17 Jan 2020 10:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vW-n+0k3vmH; Fri, 17 Jan 2020 10:03:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3386386CDB;
	Fri, 17 Jan 2020 10:03:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE8CC077D;
	Fri, 17 Jan 2020 10:03:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 066C2C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E2FB186CDB
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfaNvLuueMIX for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 10:03:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C51E86CC0
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:03:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F0116327; Fri, 17 Jan 2020 11:02:56 +0100 (CET)
Date: Fri, 17 Jan 2020 11:02:55 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 5.6
Message-ID: <20200117100255.GC15760@8bytes.org>
References: <20200116102548.GA14761@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116102548.GA14761@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe@linaro.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

On Thu, Jan 16, 2020 at 10:25:49AM +0000, Will Deacon wrote:
> Hi Joerg,
> 
> Please pull these Arm SMMU updates for 5.6. The branch is based on your
> arm/smmu branch and includes a patch addressing the feedback from Greg
> about setting the module 'owner' field in the 'iommu_ops'.
> 
> I've used a signed tag this time, so you can see the summary of the
> changes listed in there. The big deal is that we're laying the groundwork
> for PCIe PASID support in SMMUv3, and I expect to hook that up for PCIe
> masters in 5.7 once we've exported the necessary symbols to do so.
> 
> Cheers,
> 
> Will
> 
> --->8
> 
> The following changes since commit 1ea27ee2f76e67f98b9942988f1336a70d351317:
> 
>   iommu/arm-smmu: Update my email address in MODULE_AUTHOR() (2019-12-23 14:06:06 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

Pulled, thanks Will.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
