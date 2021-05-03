Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA11372352
	for <lists.iommu@lfdr.de>; Tue,  4 May 2021 00:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06F560BF3;
	Mon,  3 May 2021 22:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8V4St8QDP9l6; Mon,  3 May 2021 22:57:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72DD60BF1;
	Mon,  3 May 2021 22:57:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A86ADC0001;
	Mon,  3 May 2021 22:57:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A47B6C0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 22:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8095540F33
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 22:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ziepe.ca
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1R3b78nrNe6 for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 22:57:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 621D04067A
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 22:57:07 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 8so6830034qkv.8
 for <iommu@lists.linux-foundation.org>; Mon, 03 May 2021 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xZZm+3MFuedFCkj1MfVgDeM954nHR/3fXds6exXmQfs=;
 b=ouRSQEEjT38vBUuV862SeUlllVCT6eH9A/DLELLKUUCUzA1ShVzuWVXQ1MBHwfUp52
 o2iY2zmGF5v6LzhQq+GBDBerKVAePtFNVbGHvM38jkoESd9bfzmAI5TW5EmfL78E08Qn
 KIGOFGei7/yO8yCpBYVzXmS09DZEEm+pTY6CGCqEpqr9/YKTEYQHHgmnMtxfiJhxhwEM
 PI6Kaqk2dLQBbp3lySC34PVTv8PJZyC4fg+IILviuxHg1B8L5kSFMxjKrsIeWCcV13AT
 K2K+mR+5wr9SajVl5e5SOe9bFPiH9IuQFOm4a7VNUrSG+YlFkkc7yhkY+MYykwPRCxJe
 dU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xZZm+3MFuedFCkj1MfVgDeM954nHR/3fXds6exXmQfs=;
 b=hlWApdu7MtuilNUNcPhjlP8k164KqGMGmLDLKdWUTejjDXBJzYlrbapw+4g9DtWbyj
 9P2tNSYlVZgEuyPCDacGbdAQu89Bo93FvTSbwtD6lKPbd4dMj/HsRp9p6BMFxi96WcAE
 OLIz0iDIwcHAmwBexSNCiRcBk92JwICuyFm42JNTJdLzNx2g9xwdm1CnxxwUB8zTXEu3
 lL4ghHEYuKoGnhSRw9oaP8MUvvr9TVQXuqGOhNC6tgP34lDMkwYY5uWFrd5bof4bLyvN
 B56vMONftQsPPZfg2ZLj57tfUy6J7uk6CXF3mig/aE7JKA2I1QL25Zsr3l8WXd+sWMMp
 tdOA==
X-Gm-Message-State: AOAM530EpTOFEOjnym3iaClvEGhBJLGa85Tl2V97wmzdSILZXgu0C8I4
 CEHz4ZSGTSKBr/sgRMp4cTjuNQ==
X-Google-Smtp-Source: ABdhPJwB6nytiC0oDMbKJRBwSIes/jqgsePpJ+MXFQRNiesNGamVx4ATl+XqEZHAz4GA6Yzrb48bvQ==
X-Received: by 2002:a37:a9c8:: with SMTP id s191mr6160737qke.430.1620082626750; 
 Mon, 03 May 2021 15:57:06 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id c17sm897865qtd.71.2021.05.03.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 15:57:06 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1ldhUv-00H3QZ-2z; Mon, 03 May 2021 19:57:05 -0300
Date: Mon, 3 May 2021 19:57:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 04/16] PCI/P2PDMA: Refactor pci_p2pdma_map_type() to take
 pagmap and device
Message-ID: <20210503225705.GA2047089@ziepe.ca>
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-5-logang@deltatee.com>
 <ce04d398-e4a1-b3aa-2a4e-b1b868470144@nvidia.com>
 <f719ba91-07ba-c703-2dc9-32cb1214e9c0@deltatee.com>
 <f07f0ca7-9772-5b3b-4cea-9defcefaaf8b@nvidia.com>
 <ab0e4256-79c9-c181-5aec-f6869a92a80c@deltatee.com>
 <d4f19947-d4c1-451b-311f-9e31a4ded6fc@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4f19947-d4c1-451b-311f-9e31a4ded6fc@nvidia.com>
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-block@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Logan Gunthorpe <logang@deltatee.com>,
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

On Mon, May 03, 2021 at 02:54:26PM -0700, John Hubbard wrote:

> I guess my main concern here is that there are these pci*() functions
> that somehow want to pass around struct device.

Well, this is the main issue - helpers being used inside IOMMU code
should not be called pci* functions. This is some generic device p2p
interface that happens to only support PCI to PCI transfers today.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
