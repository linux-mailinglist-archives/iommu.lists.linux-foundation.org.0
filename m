Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A17FB2E8EF
	for <lists.iommu@lfdr.de>; Thu, 30 May 2019 01:18:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9AA6E2C54;
	Wed, 29 May 2019 23:18:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16E932C26
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 23:07:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 11E54EC
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 23:07:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g69so1692628plb.7
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EbuoCefVnNXOM+7/3lTJLOeEE6MIMd3tES4l4TDHW64=;
	b=M3qzbB1qBronEk3HobFj0grL6qxn37uEHDCE23Rc9qHgtHVbbm7aetvz/fMuixWxxU
	18ifnSGCUWmA8JSF7pqwjqGf7Vm4ytetknLeNECbQzJZYrD2xncVVlFfRqBuPK5oqm62
	A8upO2dHAIenvci/wvlYReVClbElOEFJTes8v3rFEhQaZTzVYhOjndZWm9vBfaTQ8T+m
	a7EWYUcaF6cDefqdDWahKl9XCxJobHvwxlTWGMR/HKk0ZUv258X+kfpede/Xg2Koc2k9
	ID51BNwbNVj6+5jGUZJK9BwclNT+3waLnGXyFTsrp3Z7u6G/S4EOXO30iQQHIYNUeoOd
	+Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EbuoCefVnNXOM+7/3lTJLOeEE6MIMd3tES4l4TDHW64=;
	b=nQLN53O1uXm8iSFKTm/hP2X3YZcrxNOqFcjhKtbDOBJGnXtPO4uUQUmXfQ1qmyFuEU
	YzaoaKiNKmWiD+wHnKKhxxhhoAcQpV5gzIdqlBHyD6hnUSk68Q71893rLo4WRemHzqdi
	QaCHN31BVdUnY4/qHrIOQBDBRe8dA3+oZDryTE+pzC/Yvyb6jELQkP3s4SN+aKOEjYM+
	YLN6KbIhm4+D2LDYVuIWUi6QVvrpOrCGHoRyA2Ylum7rYxat1ciB64ks4MjKI/EeooyX
	VZV1l1pEB23+2NysHcMSaqM6gawVvIdwktNWJ0qEWsI3ufIWtZw9zLrtQpFzq3e/ya0o
	iGEw==
X-Gm-Message-State: APjAAAUfswRWs93CawZM2EfHnYU8ry78PLEJGN13656KQ4K7Wnojp3mA
	MtDJpaBYD7b9g2zB2OYXaF4=
X-Google-Smtp-Source: APXvYqyZnGjzHeeiqAw/QSIZUGr4a34eKBKdG3AsoGh8+Qmht/O/mRzd7nLEOS8kavtAfsemH3fTvQ==
X-Received: by 2002:a17:902:b18f:: with SMTP id
	s15mr576136plr.44.1559171249534; 
	Wed, 29 May 2019 16:07:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22])
	by smtp.gmail.com with ESMTPSA id e6sm773276pfl.115.2019.05.29.16.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 16:07:28 -0700 (PDT)
Date: Wed, 29 May 2019 16:06:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 0/2] Optimize dma_*_from_contiguous calls
Message-ID: <20190529230618.GC17556@Asurada-Nvidia.nvidia.com>
References: <20190524040633.16854-1-nicoleotsuka@gmail.com>
	<20190528060424.GA11521@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528060424.GA11521@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tony@atomide.com, catalin.marinas@arm.com, will.deacon@arm.com,
	jcmvbkbc@gmail.com, sfr@canb.auug.org.au,
	dann.frazier@canonical.com, linux@armlinux.org.uk,
	treding@nvidia.com, linux-xtensa@linux-xtensa.org,
	keescook@chromium.org, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, chris@zankel.net,
	wsa+renesas@sang-engineering.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	iamjoonsoo.kim@lge.com, robin.murphy@arm.com
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

On Tue, May 28, 2019 at 08:04:24AM +0200, Christoph Hellwig wrote:
> Thanks,
> 
> applied to dma-mapping for-next.
> 
> Can you also send a conversion of drivers/iommu/dma-iommu.c to your
> new helpers against this tree?
> 
> http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/for-next

I can. There is a reported regression with !CONFIG_DMA_CMA now
so I will do that after a fix is merged and the whole thing is
stable.

Thank you
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
