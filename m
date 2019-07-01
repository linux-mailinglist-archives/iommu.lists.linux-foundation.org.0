Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE95C52A
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 23:49:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6589CD30;
	Mon,  1 Jul 2019 21:49:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3A681AE0
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 21:49:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA48D832
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 21:49:54 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r1so7181098pfq.12
	for <iommu@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 14:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qrAn2xUKRq25y9kmzyaSOl6EHUIG32pV7WxMNDG8GTU=;
	b=r+J3BWcpMj4stnUQYC0UzYxus0LNbXZ5INvJM2e5T4JIlGrVQqhWSbGBRKIyPr535q
	8T93C+kbCyES+mBJZR9vt94+hsAfRX4P5uErBtHBheWxL238GDa9in27SoyF8aMms66F
	IHIpfeMYQEQS8gasoKDX/WcpFaaAK/v/gFJ0VEHsCTN4MtrbkqP+ia5TDYgUpZKobLmP
	wblE/51iRadAFKuCgP6eWWFUWjzAhQr5oDFH8HsC3KkFmT3AvD9cz3OpPpna9NegTqKu
	wyuxVglV4HU+6Agumkq3w1jx5uipzIUPZfJYhIQYn21ZRvT6cIRDz/M+2RrOFoiFYeH9
	dN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qrAn2xUKRq25y9kmzyaSOl6EHUIG32pV7WxMNDG8GTU=;
	b=OrUPWnox0z+EuvpRkrxCYhFQ4hs0SBp6JuM+qWRD8BqZ2OnJW7kzVyDAulhobaJddk
	U5+ZqRO9O6ZgVsktN99kMrzY1eRiBH0mSpbAERkppRIVqozvHpbhhlADbjSK4LxYfI4o
	Um5shFcpNgVU34KL5bKIqLlQwl0oRKChgdY71hJEI0QN4OTFYslr9L87A+H0vLjqpqQ8
	T9GgusBbmMV+PzwHOJ5+iVbP7GkoPewQtSs+B4Ic85TEeDgkt0dI+GBNgGZlESCCmWo2
	UZXtTFRVIAP8OZpDqv735F7pmjYijhYNTebjvyL6EA3rcoUOjJRA24NcJBrwo9Jy0wLb
	Q1nA==
X-Gm-Message-State: APjAAAVccqNXav6a8PS6/o75zCjJDyrXQcUYjiP8nMN7rh5ZHC/uKXfk
	meJcKrFdd/MqreCEHer6Zjc=
X-Google-Smtp-Source: APXvYqybnVoHn0Mqql3MjYii8qxRZOBUD7/F4uVFfVlZKVv479rac3TNe4yf3ed1olx5G9I8U1x/2g==
X-Received: by 2002:a17:90a:26a1:: with SMTP id
	m30mr1595227pje.59.1562017794264; 
	Mon, 01 Jul 2019 14:49:54 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22])
	by smtp.gmail.com with ESMTPSA id a3sm463514pje.3.2019.07.01.14.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Jul 2019 14:49:53 -0700 (PDT)
Date: Mon, 1 Jul 2019 14:50:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Fix calculation overflow in __finalise_sg()
Message-ID: <20190701215016.GA16247@Asurada-Nvidia.nvidia.com>
References: <20190622043814.5003-1-nicoleotsuka@gmail.com>
	<20190701122158.GE8166@8bytes.org>
	<91a389be-fd76-c87f-7613-8cc972b69685@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91a389be-fd76-c87f-7613-8cc972b69685@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Robin,

On Mon, Jul 01, 2019 at 01:39:55PM +0100, Robin Murphy wrote:
> > > The max_len is a u32 type variable so the calculation on the
> > > left hand of the last if-condition will potentially overflow
> > > when a cur_len gets closer to UINT_MAX -- note that there're
> > > drivers setting max_seg_size to UINT_MAX:
> > >    drivers/dma/dw-edma/dw-edma-core.c:745:
> > >      dma_set_max_seg_size(dma->dev, U32_MAX);
> > >    drivers/dma/dma-axi-dmac.c:871:
> > >      dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> > >    drivers/mmc/host/renesas_sdhi_internal_dmac.c:338:
> > >      dma_set_max_seg_size(dev, 0xffffffff);
> > >    drivers/nvme/host/pci.c:2520:
> > >      dma_set_max_seg_size(dev->dev, 0xffffffff);
> > > 
> > > So this patch just casts the cur_len in the calculation to a
> > > size_t type to fix the overflow issue, as it's not necessary
> > > to change the type of cur_len after all.
> > > 
> > > Fixes: 809eac54cdd6 ("iommu/dma: Implement scatterlist segment merging")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > 
> > Looks good to me, but I let Robin take a look too before I apply it,
> > Robin?
> I'll need to take a closer look at how exactly an overflow would happen here

It was triggered by a test case that was trying to map a 4GB
dma_buf (1000+ nents in the scatterlist). This function then
seemed to reduce the nents by merging most of them, probably
because they were contiguous.

> (just got back off some holiday), but my immediate thought is that if this
> is a real problem, then what about 32-bit builds where size_t would still
> overflow?

I think most of callers are also using size_t type for their
size parameters like dma_buf, so the cur_len + s_length will
unlikely go higher than UINT_MAX. But just in case that some
driver allocates a large sg with a size parameter defined in
64-bit and uses this map() function, so it might be safer to
change to "size_t" here to "u64"?

Thank you
Nicolin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
