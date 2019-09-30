Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1CC2602
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 20:36:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86E6A1AC2;
	Mon, 30 Sep 2019 18:35:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 96B451AB6
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:35:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 455C88C1
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:35:54 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F1FEB224F0
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569868554;
	bh=Ad/j94Z9dDSgxHErptmrkH1hQQ6UN44H+9rW9TD3BaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kt2C+zpyCU5QHHTkmX69LUYE3htP53f+lr6SffmWb6Vnmjl3+fm/DXec1/XPFGlb9
	S5eYxPBwrvZcS0huTH82x9t7QSA3L1PkXERWLLahkdULpXJo5vxL3i5sdTU026dkLl
	0Yz2H3BWxjDdKF2rDQhqtErfgnVykztci1K+2bzU=
Received: by mail-qk1-f180.google.com with SMTP id y144so8706196qkb.7
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 11:35:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUjmmqsZG6hY+mwVpyL25Caiy3rtqgm9SYcnwhI6bwLYqV1w/zh
	PYoeLnlLhf9URqq6RcoyaLYoAgH6HURFQnLrKg==
X-Google-Smtp-Source: APXvYqxwCcb++IDx59O2am9iLB7B24VXmMEw7rKL2+M9MuGAo7hvATTBo/yJCaWV5cXESjbNZkhjl2mMUvmOoAtRWEc=
X-Received: by 2002:a37:be87:: with SMTP id o129mr1647961qkf.254.1569868553147;
	Mon, 30 Sep 2019 11:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569851517.git.robin.murphy@arm.com>
	<fc6ce3e89ae85c9010b25b9303589be944ba3811.1569851517.git.robin.murphy@arm.com>
In-Reply-To: <fc6ce3e89ae85c9010b25b9303589be944ba3811.1569851517.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Sep 2019 13:35:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLDetEBhP71k1TmJN_eCBRRamwLcCwREBWJ+sPs=aA2xw@mail.gmail.com>
Message-ID: <CAL_JsqLDetEBhP71k1TmJN_eCBRRamwLcCwREBWJ+sPs=aA2xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Correct Mali attributes
To: Robin Murphy <robin.murphy@arm.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Steven Price <steven.price@arm.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Will Deacon <will@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 30, 2019 at 9:11 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Whilst Midgard's MEMATTR follows a similar principle to the VMSA MAIR,
> the actual attribute values differ, so although it currently appears to
> work to some degree, we probably shouldn't be using our standard stage 1
> MAIR for that. Instead, generate a reasonable MEMATTR with attribute
> values borrowed from the kbase driver; at this point we'll be overriding
> or ignoring pretty much all of the LPAE config, so just implement these
> Mali details in a dedicated allocator instead of pretending to subclass
> the standard VMSA format.
>
> Fixes: d08d42de6432 ("iommu: io-pgtable: Add ARM Mali midgard MMU page table format")
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 53 +++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
