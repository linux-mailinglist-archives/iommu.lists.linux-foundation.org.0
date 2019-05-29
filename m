Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE32D56B
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 08:21:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C07A2404;
	Wed, 29 May 2019 06:21:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7B99A23FB
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 06:18:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3283CEC
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SlJAo9Q1H6Y1MH1l1DawZNFwXZmoCdx0nahsUu/QeN8=;
	b=KeAxAjEgLFUtRPQwovBoJEqbz
	T8+FcjyGQDM8krZaFZlhjfc7W7jJ9IQ74reJcgB0/lUZhIUdXr5ry+Ph0Mnlo9E7lsCkAv6kYQ3Vs
	d6+TWy4glZBYzl7yH580tMbPr0aevty1Y/hEjy67y8Aj4xeGWlonCh3ip8ZwSsBTbvV8JgNfYqSd/
	INZHesRyjDqzul7h4oWVE6lZwXZvoWFjdPUyhvAFktttue138Ps6N14Kzam1JDtylR8OUcUQoI6NG
	+NYxHjquKzeCbWZ9Eu1c4B4/0PPZy5klFa61/CeULI1b06knxKlZcYF2rAwGHuGjmJDRP+x3CrglZ
	EbMtIDnEA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hVruP-00089b-4I; Wed, 29 May 2019 06:17:57 +0000
Date: Tue, 28 May 2019 23:17:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 1/7] iommu: Fix a leak in iommu_insert_resv_region
Message-ID: <20190529061756.GB26055@infradead.org>
References: <20190528115025.17194-1-eric.auger@redhat.com>
	<20190528115025.17194-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528115025.17194-2-eric.auger@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com, jean-philippe.brucker@arm.com,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	eric.auger.pro@gmail.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

>  		} else if ((start >= a) && (end <= b)) {
>  			if (new->type == type)
> -				goto done;
> +				return 0;
>  			else
>  				pos = pos->next;

Please remove the pointless else after the return statement.

>  		} else {
>  			if (new->type == type) {
>  				phys_addr_t new_start = min(a, start);
>  				phys_addr_t new_end = max(b, end);
> +				int ret;
>  
>  				list_del(&entry->list);
>  				entry->start = new_start;
>  				entry->length = new_end - new_start + 1;
> -				iommu_insert_resv_region(entry, regions);
> +				ret = iommu_insert_resv_region(entry, regions);
> +				kfree(entry);
> +				return ret;
>  			} else {
>  				pos = pos->next;
>  			}

Same here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
