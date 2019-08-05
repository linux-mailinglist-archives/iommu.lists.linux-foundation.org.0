Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEE813EE
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 10:06:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1605BD48;
	Mon,  5 Aug 2019 08:06:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EF77DCDE
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:06:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A36678A3
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:06:33 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m23so78407471lje.12
	for <iommu@lists.linux-foundation.org>;
	Mon, 05 Aug 2019 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4jotGUYX3HDjIjrPWkq93S31gJkGTLLQx5i8QIerKxE=;
	b=OKXu80bhtKFjmm2MpkIDYVWmXqi7Y+Xjky/uEczjP2Zl5b7vO97lSZ4GxsSOJjZduQ
	VgPXNXexmCAKG6Z+637VhMExKFfEjxuDw3H3mRcIbO3qLRCxF1TJiOxHnvXkyL1xl5hz
	9tSzcuFZEaM47GjqXTJ6n5YnEqhbYAzKlpVrDHKCy9VeCfnp53elgyy+VMv+lz31Ers7
	Eic301vKwslj47MtbPz81DyzufZoA3sVB/fmBoMeBi2wwb65qyfXQctIncrR9gNzSMvv
	ew3Ty0ZvYjqCUhy9kY7gTZ+iW4B61AZpbS675ligIs/I+dyRKPx83vFtsSrTsvbz0lFJ
	WX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4jotGUYX3HDjIjrPWkq93S31gJkGTLLQx5i8QIerKxE=;
	b=nll5TmqgJYdXTKtqxCVrI5/8Bi6eM0r+lWb4slCOqJWh7wQmmieZFlBbcRqEs42m8Q
	ooHPirAyt9EKVSQlsBLgBelPbuD/RZGh5S7t+2MsjffzrHyWTiaYCXYQX48+ASl7CTOa
	rd5eS0Z7Cx79vEJU0M6wsUSKPmsaEJwRYvATmU5YbKc2r9a5gr9772pARdqGIxlehzOC
	PLUV0/ENwwZ/eDtn+4ltsGcD2HB0F4aWtl3iWCG5ijog2uW54O8YyRll+iqyYUhoQhu8
	fiWasuCN/qcF2IyIj1CS2gEFUPwkPSiLuB4/I135ORd6juret5UXLPF+8+j5ORi4Te73
	zSmA==
X-Gm-Message-State: APjAAAX2wDlOuj5DOBVFymimSLYrKJ1Qtjugex8mLI9rQSf3md3H/mim
	gGlmzX4B2YGhMQfdQF4Sq8hyww==
X-Google-Smtp-Source: APXvYqyZpQSVk777vhC2lpS6B8C38YOlvgzOQV2vQdpdrwUMZBvpR5l2r7dZg3bY6N4q4hVA/QRa0Q==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr78054712ljj.122.1564992392086; 
	Mon, 05 Aug 2019 01:06:32 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44f5:2f9a:806:ec14:8a98:a30c?
	([2a00:1fa0:44f5:2f9a:806:ec14:8a98:a30c])
	by smtp.gmail.com with ESMTPSA id
	l24sm17213019lji.78.2019.08.05.01.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 01:06:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20190805080145.5694-1-hch@lst.de>
	<20190805080145.5694-3-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f02604c5-dbea-e64e-cfb7-3a002b0da9a6@cogentembedded.com>
Date: Mon, 5 Aug 2019 11:06:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805080145.5694-3-hch@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
	Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hello!

On 05.08.2019 11:01, Christoph Hellwig wrote:

> Mips uses the KSEG1 kernel memory segment do map dma coherent

     MIPS. s/do/to/?

> allocations for n

on-coherent devices as uncachable, and does not have

    Uncacheable?

> any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
> path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
> lead to multiple mappings with different caching attributes.
> 
> Fixes: 8c172467be36 ("MIPS: Add implementation of dma_map_ops.mmap()")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
