Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE231DCF62
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 16:17:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0D2325CBB;
	Thu, 21 May 2020 14:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAPOKYQKJjrG; Thu, 21 May 2020 14:17:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C3CB25C66;
	Thu, 21 May 2020 14:17:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A926C088B;
	Thu, 21 May 2020 14:17:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30EF4C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D7E2875E2
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8IAzdzxhadn for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 14:17:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFDAD875E0
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:37 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A49A20721;
 Thu, 21 May 2020 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590070657;
 bh=5MRn3H5sZAZmyAJ7ms4hcDmOF+0kJdAcWrKPmQYOlR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hk9BuL52Yd+s1F9PZBKDi1fOj/hBpMdLhnVRrqDGLJHOMJUJ4cx1CtTqJjqji14lA
 se04HPgcV50e35bBPs6oZN10HauSB5SCTxRi9BAEpAi6JOpzQotWs8pN2P23RLU3T9
 jRk0X8KLGknqWO03sXQQpGyIbmzpKdaGmJhlarzo=
Date: Thu, 21 May 2020 15:17:31 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 13/24] iommu/arm-smmu-v3: Enable broadcast TLB
 maintenance
Message-ID: <20200521141730.GJ6608@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-14-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-14-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, maz@kernel.org,
 jgg@ziepe.ca, linux-pci@vger.kernel.org, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 robin.murphy@arm.com, christian.koenig@amd.com,
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

[+Marc]

On Tue, May 19, 2020 at 07:54:51PM +0200, Jean-Philippe Brucker wrote:
> The SMMUv3 can handle invalidation targeted at TLB entries with shared
> ASIDs. If the implementation supports broadcast TLB maintenance, enable it
> and keep track of it in a feature bit. The SMMU will then be affected by
> inner-shareable TLB invalidations from other agents.
> 
> A major side-effect of this change is that stage-2 translation contexts
> are now affected by all invalidations by VMID. VMIDs are all shared and
> the only ways to prevent over-invalidation, since the stage-2 page tables
> are not shared between CPU and SMMU, are to either disable BTM or allocate
> different VMIDs. This patch does not address the problem.

This sounds like a potential performance issue, particularly as we expose
stage-2 contexts via VFIO directly. Maybe we could reserve some portion of
VMID space for the SMMU? Marc, what do you reckon?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
