Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8542A35C0
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 22:04:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F87887332;
	Mon,  2 Nov 2020 21:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpTtW-g6-P41; Mon,  2 Nov 2020 21:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 008DF8732D;
	Mon,  2 Nov 2020 21:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF0E2C1AD7;
	Mon,  2 Nov 2020 21:03:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B791C0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1AD7D8732D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 21:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSeo7mFy7xEv for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 21:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5618887322
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 21:03:55 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3F1220756
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604351034;
 bh=QIKekPJv96xapfmbeqZyRV7a8wmsfIVO5Ur1tFoBsxQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CRnAq/wtmByBOoYx6V660YQRskTnHR9OSZtGMGbDhceo0HaOQq8ExSCwlBTJZU67/
 7+EdwCiOci/5xcpmUCMEKbhzur7k8vzQm+klaLkVJwNkE9a4SWOr4V0X9/EFV+EPl7
 hdeF+vxR15bfQ3DHwlRqmx/Ac5qW0dNeY937DLcs=
Received: by mail-oi1-f171.google.com with SMTP id s21so16140835oij.0
 for <iommu@lists.linux-foundation.org>; Mon, 02 Nov 2020 13:03:54 -0800 (PST)
X-Gm-Message-State: AOAM531vnDjOMDU2ZOrfofjsUtse9Y/I+QHVJiWS7dC73d0S5fxqIzaf
 B0gd7MAW+ms2KELdrpsj8nczTocPcyUspw2a8A==
X-Google-Smtp-Source: ABdhPJxFDSpXQtYVkltDyCL0k7wfhpIaDYr2QVmapb626fGuhI4EWsl4osaRewc4U9X7lcZXH/ws1+nFb7iAqLwe9h8=
X-Received: by 2002:a54:4588:: with SMTP id z8mr15353oib.147.1604351034017;
 Mon, 02 Nov 2020 13:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20201029172550.3523-1-nsaenzjulienne@suse.de>
 <20201029172550.3523-4-nsaenzjulienne@suse.de>
In-Reply-To: <20201029172550.3523-4-nsaenzjulienne@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 2 Nov 2020 15:03:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK17XTkHg1YVeyKmfEL7BO2xGxjUC2WccBEbcY+vOngDA@mail.gmail.com>
Message-ID: <CAL_JsqK17XTkHg1YVeyKmfEL7BO2xGxjUC2WccBEbcY+vOngDA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] of/address: Introduce of_dma_get_max_cpu_address()
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Hanjun Guo <guohanjun@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Thu, Oct 29, 2020 at 12:26 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Introduce of_dma_get_max_cpu_address(), which provides the highest CPU
> physical address addressable by all DMA masters in the system. It's
> specially useful for setting memory zones sizes at early boot time.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> ---
>
> Changes since v4:
>  - Return max address, not address limit (one-off difference)
>
> Changes since v3:
>  - use u64 with cpu_end
>
> Changes since v2:
>  - Use PHYS_ADDR_MAX
>  - return phys_dma_t
>  - Rename function
>  - Correct subject
>  - Add support to start parsing from an arbitrary device node in order
>    for the function to work with unit tests
>
>  drivers/of/address.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h   |  7 +++++++
>  2 files changed, 49 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
