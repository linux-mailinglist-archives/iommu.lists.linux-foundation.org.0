Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8F148863
	for <lists.iommu@lfdr.de>; Fri, 24 Jan 2020 15:29:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F03B88836C;
	Fri, 24 Jan 2020 14:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZlDFqtRpQnW; Fri, 24 Jan 2020 14:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E3858838F;
	Fri, 24 Jan 2020 14:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75411C0174;
	Fri, 24 Jan 2020 14:29:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EBA3C0174
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC28486D77
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 14:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qeEXtWKnkFTq for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jan 2020 14:29:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8061986D6C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 14:29:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 44E89AA1; Fri, 24 Jan 2020 15:29:10 +0100 (CET)
Date: Fri, 24 Jan 2020 15:29:07 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] iommu: amd: Fix IOMMU perf counter clobbering during
 init
Message-ID: <20200124142907.GA27081@8bytes.org>
References: <20200123223214.2566-1-skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123223214.2566-1-skhan@linuxfoundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Jan 23, 2020 at 03:32:14PM -0700, Shuah Khan wrote:
> init_iommu_perf_ctr() clobbers the register when it checks write access
> to IOMMU perf counters and fails to restore when they are writable.
> 
> Add save and restore to fix it.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Changes since v1:
> -- Fix bug in sucessful return path. Add a return instead of
>    fall through to pc_false error case
> 
>  drivers/iommu/amd_iommu_init.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

Applied for v5.5, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
