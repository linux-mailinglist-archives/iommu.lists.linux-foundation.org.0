Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6D1FA86E
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 07:57:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 599D7259EF;
	Tue, 16 Jun 2020 05:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAY6THkSSFAg; Tue, 16 Jun 2020 05:57:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3985525CF1;
	Tue, 16 Jun 2020 05:57:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13ECCC0890;
	Tue, 16 Jun 2020 05:57:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A664CC016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 05:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8E7F38767C
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 05:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydOuCJfDV6h0 for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 05:57:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BCF68746D
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 05:57:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A1D0207E8;
 Tue, 16 Jun 2020 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592287072;
 bh=UPondy/gLEeob42yBMK75A90hWsNm0WoAX0fhd+BKsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S36qoPg4Ccn1IlxtXBdfEqDkL77xw4EqbBxGpo52DJANn0SxLDqRTHMbS3hI2z64i
 gx7ZOTC+hdupxlw6FnQvel2n2QzH+BKpYDlHLVgIOucAL9T4Ubcx8KhDkWOI91R6tN
 WE6LiBCvTOoxwxm2yf564ty4NrQdJBWrQbwX0YgY=
Date: Tue, 16 Jun 2020 07:57:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH 4/4] pci: export untrusted attribute in sysfs
Message-ID: <20200616055747.GA2047@kroah.com>
References: <20200616011742.138975-1-rajatja@google.com>
 <20200616011742.138975-4-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616011742.138975-4-rajatja@google.com>
Cc: Todd Broch <tbroch@google.com>, linux-pci@vger.kernel.org,
 lalithambika.krishnakumar@intel.com, Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 linux-acpi@vger.kernel.org, Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, oohall@gmail.com,
 Benson Leung <bleung@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Alex Levin <levinale@google.com>
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

On Mon, Jun 15, 2020 at 06:17:42PM -0700, Rajat Jain wrote:
> This is needed to allow the userspace to determine when an untrusted
> device has been added, and thus allowing it to bind the driver manually
> to it, if it so wishes. This is being done as part of the approach
> discussed at https://lkml.org/lkml/2020/6/9/1331
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  drivers/pci/pci-sysfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 6d78df981d41a..574e9c613ba26 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -50,6 +50,7 @@ pci_config_attr(subsystem_device, "0x%04x\n");
>  pci_config_attr(revision, "0x%02x\n");
>  pci_config_attr(class, "0x%06x\n");
>  pci_config_attr(irq, "%u\n");
> +pci_config_attr(untrusted, "%u\n");
>  
>  static ssize_t broken_parity_status_show(struct device *dev,
>  					 struct device_attribute *attr,
> @@ -608,6 +609,7 @@ static struct attribute *pci_dev_attrs[] = {
>  #endif
>  	&dev_attr_driver_override.attr,
>  	&dev_attr_ari_enabled.attr,
> +	&dev_attr_untrusted.attr,
>  	NULL,
>  };

You also need a Documentation/ABI/ update for this new file.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
