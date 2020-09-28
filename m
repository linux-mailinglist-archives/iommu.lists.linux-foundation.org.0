Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A427B764
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 00:23:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C4DC20C41;
	Mon, 28 Sep 2020 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgU6cDPgxuZk; Mon, 28 Sep 2020 22:23:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E6BE62094D;
	Mon, 28 Sep 2020 22:22:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9991C0051;
	Mon, 28 Sep 2020 22:22:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2048AC0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 14419868E7
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUUwdOhotG11 for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 22:22:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A116385948
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:22:57 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB50A23976;
 Mon, 28 Sep 2020 22:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601331777;
 bh=KckGuHNjpXWgi3JvMZQ0Yewh2mKrNMi6Nq4AclxpP/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vpgej5UCzziq1X9FOdkJKve7/ui1qENMXIsoy6papwhzW+n3Kfh/kBthk9Od085D6
 /01kxZQxRBsJ6g59/7b/rpc5zD6P6J5ZLbNIPoUcWT3PN4h3wCXg0w9MpRtZZ72Idi
 5qkMxo/pxWThi01CSbWNg6KdX02ROJWZnJfIQ5zk=
Date: Mon, 28 Sep 2020 23:22:51 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v10 01/13] mm: Define pasid in mm
Message-ID: <20200928222250.GA12847@willie-the-truck>
References: <20200918101852.582559-1-jean-philippe@linaro.org>
 <20200918101852.582559-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918101852.582559-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: fenghua.yu@intel.com, catalin.marinas@arm.com,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 zhangfei.gao@linaro.org, robin.murphy@arm.com,
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

On Fri, Sep 18, 2020 at 12:18:41PM +0200, Jean-Philippe Brucker wrote:
> From: Fenghua Yu <fenghua.yu@intel.com>
> 
> PASID is shared by all threads in a process. So the logical place to keep
> track of it is in the "mm". Both ARM and X86 need to use the PASID in the
> "mm".
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> https://lore.kernel.org/linux-iommu/1600187413-163670-8-git-send-email-fenghua.yu@intel.com/
> ---
>  include/linux/mm_types.h | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
