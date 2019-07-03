Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8665D27A
	for <lists.iommu@lfdr.de>; Tue,  2 Jul 2019 17:13:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B91CC1C6D;
	Tue,  2 Jul 2019 15:13:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6D3D17E8
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 09:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8B971836
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 09:48:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p13so16983230wru.10
	for <iommu@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UdYCIZGQ7tAt7A88vWqWA422Qpx5IuQReKn9P3m3xX8=;
	b=PZuM9EJbQb3YhMp+qaw+VF6BwkhSSyYMquhljCcVZSO+tjIcy06ofVIGPbwYNmREXi
	pRcuGFWqgU+nSlEobDVIi97m26fD20LGHZVCL/m/+eGewb0yAO7NlvlF/9gBYN5Rgy0B
	UVcUnIeulg2Ui8pzjNF76wVB55J/p/3pN/YrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UdYCIZGQ7tAt7A88vWqWA422Qpx5IuQReKn9P3m3xX8=;
	b=hOBxWrs6dVeLLs+SqDzxEYBKzz2b1mjjbSW8y8BM2Nkbst9xPFsM0N+p8g3YM2ouND
	OzlMFq4jMOVNM+Ak23MtxiPPgoI5dL9cJ9n0DGcsUXcBGYb6SweOIqrDBIgAaZkSxWlH
	nUXxI6BOwUcLUSYH3WvhxHj6TCiCguXMKtEnc16OiFDi4tRdYAH1LQO6xOjnmBm2jKey
	Rn0ELdEk2MC+lJxfZ0v5zvIfKF2VUwKVzXA714ImFqCmij7gtQtJR6hXWmotNWQ2QeSM
	q37HPr5FeBdVWiwJ5zHnZFk3lXgtvN0qqXz7A2SBkXxtrPSqUVmOKOWkmQ7vuR+zjWKN
	qPuA==
X-Gm-Message-State: APjAAAWEMc6WeuWDE5xmOFRFCONKF1A8ZOrWBGs7YH9crV/gU8cQhO2W
	1YcVEk1FmjaZYnda8+vVcRzNXA==
X-Google-Smtp-Source: APXvYqw+cs3wphtlInYiqa/iYYLL5YBkbuaWsrCFwdpkqDK8kfUrPvl8YI8TNOvUo+26MvPNs1E1Ng==
X-Received: by 2002:adf:9487:: with SMTP id 7mr9588274wrr.114.1562060928176;
	Tue, 02 Jul 2019 02:48:48 -0700 (PDT)
Received: from [10.176.68.244] ([192.19.248.250])
	by smtp.gmail.com with ESMTPSA id
	l124sm2421987wmf.36.2019.07.02.02.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 02:48:47 -0700 (PDT)
Subject: Re: use exact allocation for dma coherent memory
To: Christoph Hellwig <hch@lst.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
References: <20190614134726.3827-1-hch@lst.de> <20190701084833.GA22927@lst.de>
Message-ID: <74eb9d99-6aa6-d1ad-e66d-6cc9c496b2f3@broadcom.com>
Date: Tue, 2 Jul 2019 11:48:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701084833.GA22927@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 02 Jul 2019 15:11:13 +0000
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
	Intel Linux Wireless <linuxwifi@intel.com>,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	linux-media@vger.kernel.org
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
From: Arend Van Spriel via iommu <iommu@lists.linux-foundation.org>
Reply-To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 7/1/2019 10:48 AM, Christoph Hellwig wrote:
> On Fri, Jun 14, 2019 at 03:47:10PM +0200, Christoph Hellwig wrote:
>> Switching to a slightly cleaned up alloc_pages_exact is pretty easy,
>> but it turns out that because we didn't filter valid gfp_t flags
>> on the DMA allocator, a bunch of drivers were passing __GFP_COMP
>> to it, which is rather bogus in too many ways to explain.  Arm has
>> been filtering it for a while, but this series instead tries to fix
>> the drivers and warn when __GFP_COMP is passed, which makes it much
>> larger than just adding the functionality.
> 
> Dear driver maintainers,
> 
> can you look over the patches touching your drivers, please?  I'd
> like to get as much as possible of the driver patches into this
> merge window, so that it can you through your maintainer trees.

You made me look ;-) Actually not touching my drivers so I'm off the 
hook. However, I was wondering if drivers could know so I decided to 
look into the DMA-API.txt documentation which currently states:

"""
The flag parameter (dma_alloc_coherent() only) allows the caller to
specify the ``GFP_`` flags (see kmalloc()) for the allocation (the
implementation may choose to ignore flags that affect the location of
the returned memory, like GFP_DMA).
"""

I do expect you are going to change that description as well now that 
you are going to issue a warning on __GFP_COMP. Maybe include that in 
patch 15/16 where you introduce that warning.

Regards,
Arend
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
