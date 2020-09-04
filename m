Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CB25D424
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:00:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 174E78750D;
	Fri,  4 Sep 2020 09:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e37H4hNxvv-4; Fri,  4 Sep 2020 09:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 846718750B;
	Fri,  4 Sep 2020 09:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B9B1C0051;
	Fri,  4 Sep 2020 09:00:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CBAFC0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7BEC886D7F
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psdkbYmjyED1 for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:00:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4381986D76
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:00:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A2C3E3D5; Fri,  4 Sep 2020 11:00:40 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:00:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/3] iommu/tegra-smmu: Reference count fixes
Message-ID: <20200904090039.GD6714@8bytes.org>
References: <20200806155404.3936074-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806155404.3936074-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jon Hunter <jonathanh@nvidia.com>
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

On Thu, Aug 06, 2020 at 05:54:01PM +0200, Thierry Reding wrote:
> Thierry Reding (3):
>   iommu/tegra-smmu: Set IOMMU group name
>   iommu/tegra-smmu: Balance IOMMU group reference count
>   iommu/tegra-smmu: Prune IOMMU group when it is released

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
