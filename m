Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 875BB1DCB0A
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 12:29:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E1C08928E;
	Thu, 21 May 2020 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gA0GFXnsJyo7; Thu, 21 May 2020 10:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A515F89283;
	Thu, 21 May 2020 10:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9790CC0176;
	Thu, 21 May 2020 10:29:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF54AC0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E9F32151F
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qa3UOQIQGnar for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 10:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A13F324C8E
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:29:23 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7774020721;
 Thu, 21 May 2020 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590056963;
 bh=1XPt6kD9iV7o2QBCozeLJ0Q2mmcvZqvbc2tntrfdIJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y246nv7zF5d7co4yRlK1N6muY6PEDZel/9PbdIwVyfa9s8yNWkkbSYEmCXDDHb58M
 OaUrpHlm3WhIQ/Q8dnyYsFS2GHrihtNqvyuYMfN3P9IgBigrBQMpsXYJo+boBgW9ib
 I7M6vSvkn7i2VZb8g5eCwf0NwOH0Sedc6cpmqgcY=
Date: Thu, 21 May 2020 11:29:18 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 3/4] iommu/arm-smmu-v3: Use pci_ats_supported()
Message-ID: <20200521102917.GD5360@willie-the-truck>
References: <20200520152201.3309416-1-jean-philippe@linaro.org>
 <20200520152201.3309416-4-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520152201.3309416-4-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ashok.raj@intel.com, linux-pci@vger.kernel.org, alex.williamson@redhat.com,
 hch@infradead.org, iommu@lists.linux-foundation.org, bhelgaas@google.com,
 robin.murphy@arm.com, dwmw2@infradead.org,
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

On Wed, May 20, 2020 at 05:22:02PM +0200, Jean-Philippe Brucker wrote:
> The new pci_ats_supported() function checks if a device supports ATS and
> is allowed to use it.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm-smmu-v3.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
