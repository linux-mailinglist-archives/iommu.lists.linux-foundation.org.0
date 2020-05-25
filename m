Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B981E1066
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 16:23:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E59A587D63;
	Mon, 25 May 2020 14:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POET6p6qvs2o; Mon, 25 May 2020 14:23:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A83287D6E;
	Mon, 25 May 2020 14:23:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16B7CC016F;
	Mon, 25 May 2020 14:23:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60F4EC016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 14:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 562218695C
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 14:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STEJ3YiE7pvG for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 14:23:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 102168693D
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 14:23:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 40130303; Mon, 25 May 2020 16:23:06 +0200 (CEST)
Date: Mon, 25 May 2020 16:23:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 5.8
Message-ID: <20200525142304.GE5221@8bytes.org>
References: <20200521173944.GM6608@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521173944.GM6608@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, May 21, 2020 at 06:39:44PM +0100, Will Deacon wrote:
> Hi Joerg,
> 
> Please pull these Arm SMMU updates for 5.8. The branch is based on your
> 'core' branch from a little while ago.
> 
> Summary in the tag.
> 
> Cheers,
> 
> Will
> 
> --->8
> 
> The following changes since commit 1b032ec1ecbce6047af7d11c9db432e237cb17d8:
> 
>   iommu: Unexport iommu_group_get_for_dev() (2020-05-05 14:36:14 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates
> 
> for you to fetch changes up to 0299a1a81ca056e79c1a7fb751f936ec0d5c7afe:
> 
>   iommu/arm-smmu-v3: Manage ASIDs with xarray (2020-05-21 14:54:06 +0100)

Pulled, thanks Will.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
