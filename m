Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B880918A279
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 19:36:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA766874BA;
	Wed, 18 Mar 2020 18:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TB8Wof+ywNWl; Wed, 18 Mar 2020 18:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5005387812;
	Wed, 18 Mar 2020 18:36:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4299BC1D8E;
	Wed, 18 Mar 2020 18:36:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3130C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 18:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D150686DEB
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 18:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPha2t4dLMTZ for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 18:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4E35A86519
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 18:36:09 +0000 (UTC)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B47D020780;
 Wed, 18 Mar 2020 18:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584556569;
 bh=CZ3vU96wdH3fiBOrH3e81maNz/01u/l6RR1bNf1AwHc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Vv41YUmsvsqbsVWt+ZlKXuMSQdIFe3V2lqbd32gGrs+rgPHII0pB5zWTktovqOeYS
 QbehFAswPQdPw1OEX0h+Tg9+6MniZ9q+7wNn8AH5lMHXIzTCuvRJb5Liofsd8EpPPM
 D0Fbn3zIg28YC8wygqWkyDujQ/3nL0FcQz/PVLU4=
Date: Wed, 18 Mar 2020 13:36:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 1/6] PCI/ATS: Export symbols of PASID functions
Message-ID: <20200318183606.GA207832@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224165846.345993-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: robh@kernel.org, linux-pci@vger.kernel.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org, will@kernel.org,
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

On Mon, Feb 24, 2020 at 05:58:41PM +0100, Jean-Philippe Brucker wrote:
> The Arm SMMUv3 driver uses pci_{enable,disable}_pasid() and related
> functions.  Export them to allow the driver to be built as a module.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/ats.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index 3ef0bb281e7c..390e92f2d8d1 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -366,6 +366,7 @@ int pci_enable_pasid(struct pci_dev *pdev, int features)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(pci_enable_pasid);
>  
>  /**
>   * pci_disable_pasid - Disable the PASID capability
> @@ -390,6 +391,7 @@ void pci_disable_pasid(struct pci_dev *pdev)
>  
>  	pdev->pasid_enabled = 0;
>  }
> +EXPORT_SYMBOL_GPL(pci_disable_pasid);
>  
>  /**
>   * pci_restore_pasid_state - Restore PASID capabilities
> @@ -441,6 +443,7 @@ int pci_pasid_features(struct pci_dev *pdev)
>  
>  	return supported;
>  }
> +EXPORT_SYMBOL_GPL(pci_pasid_features);
>  
>  #define PASID_NUMBER_SHIFT	8
>  #define PASID_NUMBER_MASK	(0x1f << PASID_NUMBER_SHIFT)
> @@ -469,4 +472,5 @@ int pci_max_pasids(struct pci_dev *pdev)
>  
>  	return (1 << supported);
>  }
> +EXPORT_SYMBOL_GPL(pci_max_pasids);
>  #endif /* CONFIG_PCI_PASID */
> -- 
> 2.25.0
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
