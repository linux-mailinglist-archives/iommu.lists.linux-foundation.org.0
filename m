Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 45677349841
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:38:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66BCF4058D;
	Thu, 25 Mar 2021 17:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8Fm91L_m6mJ; Thu, 25 Mar 2021 17:38:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75B1040F1D;
	Thu, 25 Mar 2021 17:38:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51F44C000A;
	Thu, 25 Mar 2021 17:38:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D1D2C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08A4E84A61
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7WyneSz5Lx7 for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:38:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85F5884A5D
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:38:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D01861A28;
 Thu, 25 Mar 2021 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693881;
 bh=kLU4dMuIpS+s+W/i7Bpf406Q9DoXN9YHgPK4PWuvqqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i7F02zsvW5dF2qOyc0dqsQKG32TjW3bT97zlZn+2iAnDga/2TG37hUAE/4J3bXFcl
 HVA07BhW1NVdoJ05AOUQ9hfTidbZzhSpcaL65eedcLytYKRRrTornGWQo2WgqHIjD1
 fGK/+tkAohjvKGMZiKht+liPFkHq/o4mQuOGq+DY1HqwwtiO7JLt+Bm4dLC1mQIB1J
 qiJFP4X9DxYvO/LoezN/z+SfcOBml/5kJa/E/Qmj61gKhAYcxm+uewRWx7jNzZQudn
 pjOBfCV5bvYS6e/90TadJdfPWpnuvnM/Ta4Z9cDUyJN55iJ6EhSl9M0yGvGlL20kYt
 2CcHyVUXG1frg==
Date: Thu, 25 Mar 2021 17:37:53 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v13 01/10] iommu: Fix comment for struct iommu_fwspec
Message-ID: <20210325173753.GC15504@willie-the-truck>
References: <20210302092644.2553014-1-jean-philippe@linaro.org>
 <20210302092644.2553014-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302092644.2553014-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

On Tue, Mar 02, 2021 at 10:26:37AM +0100, Jean-Philippe Brucker wrote:
> Commit 986d5ecc5699 ("iommu: Move fwspec->iommu_priv to struct
> dev_iommu") removed iommu_priv from fwspec and commit 5702ee24182f
> ("ACPI/IORT: Check ATS capability in root complex nodes") added @flags.
> Update the struct doc.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  include/linux/iommu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
