Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7ED24F517
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 10:44:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78C2085B4A;
	Mon, 24 Aug 2020 08:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNmYTyVBphCb; Mon, 24 Aug 2020 08:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1969785B04;
	Mon, 24 Aug 2020 08:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B7A7C0051;
	Mon, 24 Aug 2020 08:44:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D2C0C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F047E2043A
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHWwFC4Onjad for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 07:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by silver.osuosl.org (Postfix) with ESMTPS id B67E220491
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 07:01:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h19so8356665ljg.13
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=fRrWJebqtDPE5a0QTvrg+Ip5HAVNkBaX5WcYKUdquHU=;
 b=e0qHfJC6NykC0fpsu09fya876peVANKtIF5i8l7Mp868dHDa4MB37i0AehmZtIaJLo
 A1lhoSfGZNYdAGYuSBmku3oI0P/UXNaEHyIuvZVxNnsaCuUVkJg3pMNlJsI/Kwzxc+CQ
 e6JylDbqp6EX/Y0bP8hDv5GkhcpX+uAOz9eitUYuJTl/I2cIr1/E8DlpG4weD/sEVyDQ
 27KEJfd2FU8L0oT/HpkSLfWaTRP7r0NIX43H8bw9oHd4FFxgqg8oxdUvEa6JJoxtyzgS
 F5YqjMZrs1hiR0xq+Kc3PaYkytovlHD6OIAv2GJ1RHene/j0guu8tA2bxGmoKZLS436G
 LWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=fRrWJebqtDPE5a0QTvrg+Ip5HAVNkBaX5WcYKUdquHU=;
 b=mEedZl33o+Z3bHIeDBKAr6uSr2rVlfDfLS+i90MJydrcpP9kExuCvq0YtRSCKWZcCY
 nYixcvx/nVnXG4C0tuJtzRxxJlkfoBx3JK8ehi1lyqaRDvQ9k3k2ARu5StFVi+NoWctg
 XFLehqmwYXS8Pk9GtF/OLBW75BzzN97ZFrxaI3ad+N7yEUaCU9Vz/WOGtAi+q7rfrP4g
 3aZQ9XXtl/yDJ81XbiiLNf42stub2h8gPtAhYl/YQQc+L/36c7aZvLg7nwC0g42jzxw8
 zPEaSUCSRgH9aaxNyye2ScgfcA37rFly8xpEGPgDq6l0V0SCXRvFFd4jys5ufUz0yVmX
 90Vw==
X-Gm-Message-State: AOAM5304U6UHm/+oyh/HWTPRaZoQ28EauPJGZzkogD3HOCck1LLwrUCp
 MaV6yumZu9WPVJRbLsExmG8=
X-Google-Smtp-Source: ABdhPJyIPVnsdRQmF/atPHwzzNG8Qi60Ugpn+pOfVJ7GNZ35jQM9aYfdD5qehZx0YKxChvu/Bhs+ZQ==
X-Received: by 2002:a2e:9d85:: with SMTP id c5mr1828888ljj.343.1598252461549; 
 Mon, 24 Aug 2020 00:01:01 -0700 (PDT)
Received: from [192.168.1.156] ([77.95.11.5])
 by smtp.googlemail.com with ESMTPSA id r14sm1996806ljm.92.2020.08.24.00.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 00:01:00 -0700 (PDT)
To: iommu@lists.linux-foundation.org
From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCf0YvQv9GC0LXQsg==?= <spyptev@gmail.com>
Subject: Where are iommu region setup in dma_alloc_from_dev_coherent() track?
Message-ID: <55a26221-96cc-5789-f5b0-8572be8358fb@gmail.com>
Date: Mon, 24 Aug 2020 10:01:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: ru
X-Mailman-Approved-At: Mon, 24 Aug 2020 08:44:28 +0000
Cc: Christoph Hellwig <hch@infradead.org>, Robin Murphy <robin.murphy@arm.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi!

I try to port our 3D scanner driver to kernel v4.9 and I have a trouble. 
I can not find a correct way to allocate DMA memory with correct iommu 
setup. Could you help me?

HW: Tegra X1 and Tegra X2 (arm64), our PCIe bus master device uses about 
200M of system memory to send data from sensors. The memory is organized 
in circular buffer (8 frames) and one info page (only 8 bytes are used now).
Old driver works at kernel v3.10 and some memory access rules are new in 
v4.9, such as iommu.

I try to use reserved memory region attached to the device in device 
tree and dma_alloc_coherent() to allocate the buffer. (Then I am going 
to find correct flags to turn off coherency and to sync data to CPU 
manually when full frame is arrived.)

Unfortunately, iommu does not set the area.

I've tried to find why. I see iommu calls in general dma memory 
allocation where arch-dependent dma_ops are used (and it sets iommu 
area, I can see it in /sys/kernel/debug), but I can not find the calls 
in per-device allocation track. So I do not see if my code is not 
working because of my bugs or I use wrong concept or it is bug in kernel.

Is there iommu setup in per-device reserved memory allocator (or may be 
earlier in memory reservation)? If no, why? Is it a feature or a bug?

While there are some significant changes in the code from v4.9 to v5.8, 
I have not found any related to iommu in the area, so I think it may be 
the same problem with latest kernel version.

Thanks,
Sergei Pyptev

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
