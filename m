Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9041B6AA
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 20:48:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B812C829A9;
	Tue, 28 Sep 2021 18:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPUox4F0EYAu; Tue, 28 Sep 2021 18:48:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C914F8299E;
	Tue, 28 Sep 2021 18:48:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B28CC000D;
	Tue, 28 Sep 2021 18:48:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99EA9C000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 18:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C0D2403A8
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 18:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ziepe.ca
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIxjGmAYIpDV for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF3B140374
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 18:48:50 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id j13so20849400qtq.6
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V9OdhKHkz+bDWOgw519ym53HGQqRyLuvFdP/XrS7z5w=;
 b=U6Cle1ar5YMOX4vRLBQAyCUIzflL0rP5DDqpOBJE+YXNQaN+2OCi9d0Iy1j+ZqEb0q
 ldJaiLHkalWypayZHQx3L3YPO9DcOqCmj/7fnNa9sm7+IILMYJgnEeoBHOfV3+5sIA1G
 7PoT13IhlGy54nJMnWjX2JC+DO7VxjDE7MqR0TIZG4kkDyH5MeFimp+WrD7+H8fZcSrr
 rjU6GjV1RHVgJefkq1bsjD7HjG42edUR2AMuNMVNVDWGsf2VmvclfT7eJ7t5/82dwAMV
 kHPwsALEwDASPTTgXVp7pyVtxMvNs1y+xdofJ6ktmPZVIieklzttcPQ7dqgixshVYpDP
 cjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V9OdhKHkz+bDWOgw519ym53HGQqRyLuvFdP/XrS7z5w=;
 b=xF8elQYUPbwFDY/YvYrYDXnoJPUCODVThmaecEYde5gL66uh93IlVTo/v3PEWIBiP9
 /QRtF3Q3+FUgz3QahK0Ad1kNQyLLre/B8HJoK996f/B1kl3sTS+3Hv3uqlyG1KLvVS8f
 +kXuuR3PjwEUVL1oTtfSH2ttYA/MQjPD/Wt3BQWkGYpep+Z3kYUvmHSOBOyCgWSm+pbU
 MEpbeBsW6HvQPnqaXVCGlFVunAGW7gIKdkqVn4bIKH1lG05CHG0vsz+MJshYlBi6ePNW
 SRQnDDjPqW1by3eBXtvEpUCLxzE0SXEOJxKZGTyiv9yhG7Lc5+DBtAWmtr9idgpPVxvG
 lKQw==
X-Gm-Message-State: AOAM533oWbkFrI3f5n65FiIlQN2ND+Rrc1kCs+cNqMrkF7ZpRgqka7dR
 5qDphNH7MkXaiU3nLSzh+CMBXw==
X-Google-Smtp-Source: ABdhPJxMh4uLV/Co2Bi0Uj4NMD1oETxTUQz1ehKuaeVQOMiXGKhC5tKssJhY1an+RZ/0cNTGVGgAwg==
X-Received: by 2002:ac8:46c8:: with SMTP id h8mr7389965qto.341.1632854929767; 
 Tue, 28 Sep 2021 11:48:49 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id b65sm15601470qkc.46.2021.09.28.11.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 11:48:49 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mVI9o-007FZ4-5q; Tue, 28 Sep 2021 15:48:48 -0300
Date: Tue, 28 Sep 2021 15:48:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 03/20] PCI/P2PDMA: make pci_p2pdma_map_type() non-static
Message-ID: <20210928184848.GK3544071@ziepe.ca>
References: <20210916234100.122368-1-logang@deltatee.com>
 <20210916234100.122368-4-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916234100.122368-4-logang@deltatee.com>
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
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

On Thu, Sep 16, 2021 at 05:40:43PM -0600, Logan Gunthorpe wrote:
> +enum pci_p2pdma_map_type {
> +	/*
> +	 * PCI_P2PDMA_MAP_UNKNOWN: Used internally for indicating the mapping
> +	 * type hasn't been calculated yet. Functions that return this enum
> +	 * never return this value.
> +	 */
> +	PCI_P2PDMA_MAP_UNKNOWN = 0,
> +
> +	/*
> +	 * PCI_P2PDMA_MAP_NOT_SUPPORTED: Indicates the transaction will
> +	 * traverse the host bridge and the host bridge is not in the
> +	 * whitelist. DMA Mapping routines should return an error when

I gather we are supposed to type allowlist now

> +	 * this is returned.
> +	 */
> +	PCI_P2PDMA_MAP_NOT_SUPPORTED,
> +
> +	/*
> +	 * PCI_P2PDMA_BUS_ADDR: Indicates that two devices can talk to
> +	 * eachother directly through a PCI switch and the transaction will

'each other'

> +	 * not traverse the host bridge. Such a mapping should program
> +	 * the DMA engine with PCI bus addresses.
> +	 */
> +	PCI_P2PDMA_MAP_BUS_ADDR,
> +
> +	/*
> +	 * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE: Indicates two devices can talk
> +	 * to eachother, but the transaction traverses a host bridge on the

'each other'

> +	 * whitelist. In this case, a normal mapping either with CPU physical
> +	 * addresses (in the case of dma-direct) or IOVA addresses (in the
> +	 * case of IOMMUs) should be used to program the DMA engine.
> +	 */
> +	PCI_P2PDMA_MAP_THRU_HOST_BRIDGE,
> +};

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
