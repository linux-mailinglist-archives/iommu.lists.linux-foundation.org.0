Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AA162C14
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 18:15:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B9DDF20489;
	Tue, 18 Feb 2020 17:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSJP0X7TMlgZ; Tue, 18 Feb 2020 17:15:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E6500204B2;
	Tue, 18 Feb 2020 17:15:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C23F9C013E;
	Tue, 18 Feb 2020 17:15:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F1DCC013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B9A4204A5
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y65rcg0YfEn1 for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id CB4BF20489
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7a7BeuJeRNU5QeUULzHih8KoXjfLOlATiPV+cUmscGw=; b=QIjdz8QSjjIzAMdVllBXV1Ditl
 VdQfMjoATPnUCECUsv27WHAJ189BzjMml0/WCJWrgl36BxxoeO80uWMODrvi1iZBmsS+hh7dIiy44
 b+Zgrd143+f6dmQmLhZQ+FuH9ePMXl2ELA3qXgOzTDtEUEbb60nIa36OV97pUwOYLaeU/LzPg4UzL
 AJtwyIqOXYgNzO6uGl+GlSImIP5h2zicGElavdnAACUdimW5ZnFJN7jRzb/7V/eo9FMyiywWCQVem
 YDW+lqCuAVv+D7I4cdz6hEyYPzvN50Daw+JTBPbfKlKtHLSO7rU09izm9Se5yBKKdo+rL7lADysxb
 DeAvxGgQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j46SU-00038d-O4; Tue, 18 Feb 2020 17:14:54 +0000
Date: Tue, 18 Feb 2020 09:14:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 1/5] iommu/vt-d: Add attach_deferred() helper
Message-ID: <20200218171454.GA7067@infradead.org>
References: <20200217193858.26990-1-joro@8bytes.org>
 <20200217193858.26990-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217193858.26990-2-joro@8bytes.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
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

> +static bool attach_deferred(struct device *dev)
> +{
> +	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
> +}

This is not a very useful helper.

> +
>  /**
>   * is_downstream_to_pci_bridge - test if a device belongs to the PCI
>   *				 sub-hierarchy of a candidate PCI-PCI bridge
> @@ -2510,8 +2515,7 @@ struct dmar_domain *find_domain(struct device *dev)
>  {
>  	struct device_domain_info *info;
>  
> -	if (unlikely(dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO ||
> -		     dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO))
> +	if (unlikely(attach_deferred(dev) || iommu_dummy(dev)))
>  		return NULL;

I'd rather kill the iommu_dummy helper as well.  And IIRC I have an
outstanding series somewhere that does just that..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
