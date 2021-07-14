Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E092E3C8343
	for <lists.iommu@lfdr.de>; Wed, 14 Jul 2021 12:52:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8040F82846;
	Wed, 14 Jul 2021 10:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQoVhWTsDgkJ; Wed, 14 Jul 2021 10:52:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81CA6826C0;
	Wed, 14 Jul 2021 10:52:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E67DC001F;
	Wed, 14 Jul 2021 10:52:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB50C000E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7714B40588
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6iNgD22iKnA for <iommu@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 10:52:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9F9740299
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:52:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 753AD352; Wed, 14 Jul 2021 12:52:24 +0200 (CEST)
Date: Wed, 14 Jul 2021 12:52:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] iommu/tegra-smmu: Change debugfs directory name
Message-ID: <YO7B56Mkz3kx5U5Q@8bytes.org>
References: <20210712001341.11166-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712001341.11166-1-digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Will Deacon <will@kernel.org>
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

On Mon, Jul 12, 2021 at 03:13:41AM +0300, Dmitry Osipenko wrote:
> -	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));
> +	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, "smmu");

Are you sure no one is relying on the old name so that this change
breaks ABI? Also this change means that there is always be only one SMMU
per system. Is that guaranteed too?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
