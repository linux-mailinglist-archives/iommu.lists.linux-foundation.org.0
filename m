Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4071006A
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 21:48:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D0A71DB4;
	Tue, 30 Apr 2019 19:48:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DAECEF23
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 19:47:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 82227608
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 19:47:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k19so7337034pgh.0
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=86GCSVrH9zo4gh156Oo5t8O2oP844A9QOA6J/OXOUxA=;
	b=RDkJwLgMXXBm7lJVQVTDnpEtriShEMPyVioxbhNW+zutYavuTMg0jbA7KIZU4ozWRa
	8IKC2EuvJi2rhxPjTUZf1t+gqmpJmc0a2yR3dcSEgC3NkAxERDqQkgahjcwvC4xbE/s/
	fkqW1OL++MlrDw6zQJ/HjWBnDv+IepQfzMfnf4gVq8buMVXCo0K6M29JIcQnC7woKwCD
	JlWH0/et3lm4jQE3SZXbnI2Oo5K+IbpTg3UuIYzsNpp7j2R16SRawvjYXnsLMOP+lM27
	rM0z3Ay7JsxNp4jcVY93LELKhAPfTqirUOfIR5/m9hA83EmsvwL4OoWKuXyfmjOIJ6oM
	SaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=86GCSVrH9zo4gh156Oo5t8O2oP844A9QOA6J/OXOUxA=;
	b=iIe3GPlRJjfiJ731+YPB1X5goqjLBCTHd1asL9Wu8YLmrRK7a0elIhslLAEBNXVzuY
	n0O8RqeGBmLRp+RPoS4n7KgWVf1vIJYyknf+CPM6hjjiAUEaqW6bzfQyOeCfCFfpfa3k
	pRv8//baHjj17tXE3HEH4c73Cj0JZcugILZ1sRKh3Grzx9G5JTOE8ep77mKXRROz0zWF
	fd5Sw1xRkWR2ndelC2+56ZGDZ6dO5eye92mQW1Hhr2uAjAepQUUT6aAtjbnlY0V9Ur7D
	cNskDlnG/tRChL9npPFrYlwjXI+MjuA8p7oDatg8Ol/MNyLESJKHfYvia1eGgrpzzJ7w
	Az7Q==
X-Gm-Message-State: APjAAAVKVTOuJ4nq1xJC3rQQu+bos8hYuDk05DWvud8hIfDjS4xQDbfv
	0l20bNKusCxMLrKeXpP+fgo=
X-Google-Smtp-Source: APXvYqzFBvVULwHUiGXsDPHzgJbD3J/zaoDiLOXodZvC2mcsihPg9PVzKdT/PfoC4gUpNKvmhCjzaA==
X-Received: by 2002:a63:3fc1:: with SMTP id
	m184mr34699554pga.222.1556653670976; 
	Tue, 30 Apr 2019 12:47:50 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22]) by smtp.gmail.com with ESMTPSA id
	g24sm5419285pfi.126.2019.04.30.12.47.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 12:47:50 -0700 (PDT)
Date: Tue, 30 Apr 2019 12:46:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC/RFT PATCH 1/2] dma-contiguous: Simplify
	dma_*_from_contiguous() function calls
Message-ID: <20190430194612.GA31543@Asurada-Nvidia.nvidia.com>
References: <20190430015521.27734-1-nicoleotsuka@gmail.com>
	<20190430015521.27734-2-nicoleotsuka@gmail.com>
	<20190430105640.GA20021@lst.de>
	<0e3e6d8b-de44-d23e-a039-8d11b578ec5c@arm.com>
	<20190430151833.GB25447@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430151833.GB25447@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: chris@zankel.net, linux-xtensa@linux-xtensa.org, keescook@chromium.org,
	sfr@canb.auug.org.au, tony@atomide.com, catalin.marinas@arm.com,
	will.deacon@arm.com, linux@armlinux.org.uk,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	jcmvbkbc@gmail.com, wsa+renesas@sang-engineering.com,
	akpm@linux-foundation.org, treding@nvidia.com,
	dwmw2@infradead.org, iamjoonsoo.kim@lge.com,
	linux-arm-kernel@lists.infradead.org
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

On Tue, Apr 30, 2019 at 05:18:33PM +0200, Christoph Hellwig wrote:
> On Tue, Apr 30, 2019 at 01:37:54PM +0100, Robin Murphy wrote:
> > On 30/04/2019 11:56, Christoph Hellwig wrote:
> >> So while I really, really like this cleanup it turns out it isn't
> >> actually safe for arm :(  arm remaps the CMA allocation in place
> >> instead of using a new mapping, which can be done because they don't
> >> share PMDs with the kernel.
> >>
> >> So we'll probably need a __dma_alloc_from_contiguous version with
> >> an additional bool fallback argument - everyone but arms uses
> >> dma_alloc_from_contiguous as in your patch, just arm will get the
> >> non-fallback one.
> >
> > Or we even just implement dma_{alloc,free}_contiguous() as a wrapper around 
> > the existing APIs so that users can be thoroughly checked and converted 
> > one-by-one.
> 
> Yeah.  Actually given all the contention I wonder if the easiest solution
> for now is to just open code the cma_alloc/cma_free calls in dma-direct
> and dma-iommu, with the hopes that everyone is going to migrate to those
> implementations in the mid-term anyway and dma_alloc_from_contiguous /
> dma_release_from_contiguous just go away..

Thanks for the comments.

Listing all the solutions as a summary:
A) Add "bool fallback" to dma_{alloc,free}_contiguous, and let
   ARM use fallback=false.
B) Continue replacing "_from" with dma_{alloc,free}_contiguous
   but let callers like ARM use cma_alloc/free() directly.
C) Have both new dma_{alloc,free}_contiguous and "_from" funcs.
   Implement the new one to dma-direct only as an initial step
   and change others one-by-one in the future.

Combining the comments at alloc_pages_node(), I guess that the
Solution C would be a better (cleaner) one?

List of to-change callers for Solution C:
 kernel/dma/direct.c

List of to-exclude-for-now callers for Solution C:
 arch/arm64/mm/dma-mapping.c
 drivers/iommu/amd_iommu.c
 drivers/iommu/intel-iommu.c
 arch/arm/mm/dma-mapping.c
 arch/xtensa/kernel/pci-dma.c
 kernel/dma/remap.c
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
