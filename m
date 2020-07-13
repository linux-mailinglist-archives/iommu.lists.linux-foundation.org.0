Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72621D790
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 15:50:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E62A877FB;
	Mon, 13 Jul 2020 13:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4J7pRXSP7J3G; Mon, 13 Jul 2020 13:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF645877B7;
	Mon, 13 Jul 2020 13:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A566EC0733;
	Mon, 13 Jul 2020 13:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEC99C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A6FC893C5
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cB0da5l97Q-E for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 13:50:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2A19B893C3
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:50:27 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3419206F4;
 Mon, 13 Jul 2020 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594648227;
 bh=zx+4Nn0WfziKJQDknstYCw7HzoUzPTgS03z9BIVq5Y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CWJs6c41a1vUpwjTSeKRjm45pshqAXeZaQakNlzF7KpEth8qeT5EB4TX6PXc9DBKL
 vhMS9bIIuLyg2+hoHEX+xh++nofLTHpV9tS6SZOeKvp5WuXfFYgPOE2nDcHS0/pgob
 NLawUJduIQdac3phQNUD8LP+8MdaxnXT64+wh1q8=
Date: Mon, 13 Jul 2020 14:50:20 +0100
From: Will Deacon <will@kernel.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 0/5] NVIDIA ARM SMMU Implementation
Message-ID: <20200713135020.GD2739@willie-the-truck>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708050017.31563-1-vdumpa@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 praithatha@nvidia.com, bhuntsman@nvidia.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, talho@nvidia.com, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
 yhsu@nvidia.com, treding@nvidia.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On Tue, Jul 07, 2020 at 10:00:12PM -0700, Krishna Reddy wrote:
> Changes in v10:
> Perform SMMU base ioremap before calling implementation init.
> Check for Global faults across both ARM MMU-500s during global interrupt.
> Check for context faults across all contexts of both ARM MMU-500s during context fault interrupt.
> Add new DT binding nvidia,smmu-500 for NVIDIA implementation.

Please repost based on my SMMU queue, as this doesn't currently apply.

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
