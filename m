Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C31DCF50
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 16:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 614818862D;
	Thu, 21 May 2020 14:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znuyw8CQ9yeq; Thu, 21 May 2020 14:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A09768861D;
	Thu, 21 May 2020 14:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8729CC0176;
	Thu, 21 May 2020 14:16:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D450C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0918287B97
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4nnRdfg8zFH for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 14:16:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9647187B65
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:46 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CAC020721;
 Thu, 21 May 2020 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590070606;
 bh=J12/yI4JkwQoq0ZSsn8yVG8aHccxtJvArFtbGq3PfLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iLRAgstVdYm1eiYPWiirwh1nShyQnHb3MswJtEKjwgAgUxm1QVDn5HxOYZ69IgQ9O
 +bdDwuNQWPqhCTAcnwC/oKn7WosmzTgtEnBMm154hZhbBmPdVk0+3b4h92ALYIFy4S
 VN3+rF0oD3wb2KHpTYm7ICypRf6sf4/Xdzh9FkDw=
Date: Thu, 21 May 2020 15:16:39 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 07/24] iommu/io-pgtable-arm: Move some definitions to
 a header
Message-ID: <20200521141638.GF6608@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-8-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-8-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, fenghua.yu@intel.com, hch@infradead.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 catalin.marinas@arm.com, felix.kuehling@amd.com, robin.murphy@arm.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
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

On Tue, May 19, 2020 at 07:54:45PM +0200, Jean-Philippe Brucker wrote:
> Extract some of the most generic TCR defines, so they can be reused by
> the page table sharing code.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/io-pgtable-arm.h | 30 ++++++++++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c | 27 ++-------------------------
>  MAINTAINERS                    |  3 +--
>  3 files changed, 33 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm.h

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
