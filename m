Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4E2C3EB0
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 12:04:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB36486C5D;
	Wed, 25 Nov 2020 11:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90wqpFYVgrC2; Wed, 25 Nov 2020 11:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E73E86C43;
	Wed, 25 Nov 2020 11:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54856C0052;
	Wed, 25 Nov 2020 11:04:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA807C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 11:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5A2887534
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 11:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CnKhCuiEGqD for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 11:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 60F4787476
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 11:03:56 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9975320665;
 Wed, 25 Nov 2020 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606302235;
 bh=CzEeT5Xh6gcRrt1T4vSx7QTc/WixV1DBolwFwAp6bHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlCdrz+d2NL2ohysbnzrEpzCD/t0Ptpr3tblxV1jjz6Xr+acDgEE2w0CVhQKttNCF
 YStajaMO1kwITjvtHTf5DbOlhiPnWkezXACcJWKiRf4yUhr8qr1ih0FX6XxIMKbAd2
 Y1ntdcbddrRnEXNqjVw5J5QQHtrlsnefd6RwfoRY=
Date: Wed, 25 Nov 2020 11:03:50 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH RESEND v2 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Message-ID: <20201125110349.GA15239@willie-the-truck>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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

On Wed, Nov 25, 2020 at 02:10:08AM -0800, Nicolin Chen wrote:
> Changelog
> v1->v2:
>  * Added Thierry's acks to PATCH-3~5
> 
> This is a merged set of resend for previously two series of patches
> that were reviewed/acked a month ago yet have not got applied.

Thanks, and sorry I missed these (I'm doing my best). I'll queue the
lot for 5.11.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
