Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F726F89F
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:49:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3907287069;
	Fri, 18 Sep 2020 08:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5ecGTv5bAnp; Fri, 18 Sep 2020 08:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 179928706E;
	Fri, 18 Sep 2020 08:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E28C0051;
	Fri, 18 Sep 2020 08:49:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6131BC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4D699204F7
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F26k0m4RstNM for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:49:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id E8AD3203C7
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:49:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E5DCC39A; Fri, 18 Sep 2020 10:49:12 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:49:11 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Wesley Sheng <wesley.sheng@amd.com>
Subject: Re: [PATCH] iommu/amd: Add prefetch iommu pages command build function
Message-ID: <20200918084911.GI31590@8bytes.org>
References: <20200905071420.20190-1-wesley.sheng@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905071420.20190-1-wesley.sheng@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, wesleyshenggit@sina.com,
 linux-kernel@vger.kernel.org
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

On Sat, Sep 05, 2020 at 03:14:20PM +0800, Wesley Sheng wrote:
> +static void build_pf_iommu_pages(struct iommu_cmd *cmd, u64 address,
> +					u16 devid, int pfcnt, bool size,
> +					bool inv)
> +{
> +	memset(cmd, 0, sizeof(*cmd));
> +
> +	address &= PAGE_MASK;
> +
> +	cmd->data[0]  = devid;
> +	cmd->data[0] |= (pfcnt & 0xff) << 24;
> +	cmd->data[2]  = lower_32_bits(address);
> +	cmd->data[3]  = upper_32_bits(address;
> +	if (size)
> +		cmd->data[2] |= CMD_INV_IOMMU_PAGES_SIZE_MASK;
> +	if (inv)
> +		cmd->data[2] |= CMD_PF_IOMMU_PAGES_INV_MASK;
> +	CMD_SET_TYPE(cmd, CMD_PF_IOMMU_PAGES);
> +}

This also needs to add a user of this function.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
