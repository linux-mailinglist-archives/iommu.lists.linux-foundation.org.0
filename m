Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D7230114
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 07:06:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A8E21207A9;
	Tue, 28 Jul 2020 05:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LU+WMEzQuoyH; Tue, 28 Jul 2020 05:06:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7336C22008;
	Tue, 28 Jul 2020 05:06:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 618F2C004D;
	Tue, 28 Jul 2020 05:06:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AA10C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 05:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F5A122008
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 05:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7PBpUX6C2zO for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 05:05:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 896B9207A9
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 05:05:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q75so11298389iod.1
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jul 2020 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5goD+3ukuceyveBM5Qmp+xUfwXY64ez7WeUX2kpr76A=;
 b=XhO/SGS6T1W1KprpM6TEDp6v5rEsFtuo9nUz3RFtVUEqqO6qIXd/Tx6vQOuZnelElE
 /zNKxhx0r1aHCmfRMBa5uqobl9L81oNfmuZcPY7vSPUF5ZRIbJWM/7lWslT1a2TtjhAx
 EbBfzaAvndP3qDzdvibSO5MK7sdgkpXp9Z7aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5goD+3ukuceyveBM5Qmp+xUfwXY64ez7WeUX2kpr76A=;
 b=DyW7qCsKy9Y1i0AAmkZh4F7PeuGp4Sgo4DIabb07hNeqJZ7+aNpFE/I+nELXLi2b29
 LXn6NZn/wm5g1LZUGnDWHjZ19ir+V+a2bBU9mp1x8tfyI64B//C7wtCNcXEI9HdyhPPD
 9qqmDdbUdENDb6armKjxg3sD0/gxUYY8nkCEUJYQjr/priJm/2SFl0DhyXnGFCgxd4Gv
 kbDrHyVQh075K1QU/wSsIMel1/Eertoxt4a8zHQf+aZxwTdnRPDUpIBqjw0t3izwYP7P
 yG/V6ZpwrVvauPBQpdj0uT0BWfhhG1mcB6nUppt3R2S2KiK6AerpjHDe+qwPt0e/Eg8x
 oAgQ==
X-Gm-Message-State: AOAM530ZKf3GBTNYjS91LOOcvTOyEX4zpeM9aIs4yNid7okUM5pwjdkt
 IIdGmvPIromW3iYl/eiz2LxOw1m0IlY=
X-Google-Smtp-Source: ABdhPJyt8SuHFXYnEvMd3qbwk9VJj0c0eDXfdXlwVlPMrXuwbOhIF+Sa7lWjI54eOSwGrkTzF3LkJg==
X-Received: by 2002:a02:6d5b:: with SMTP id e27mr20630493jaf.19.1595912757649; 
 Mon, 27 Jul 2020 22:05:57 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id i3sm97869ill.38.2020.07.27.22.05.55
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 22:05:56 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id w12so5836199iom.4
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jul 2020 22:05:55 -0700 (PDT)
X-Received: by 2002:a5d:9a86:: with SMTP id c6mr13430058iom.27.1595912755484; 
 Mon, 27 Jul 2020 22:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713091211.2183368-1-tientzu@chromium.org>
 <20200713091211.2183368-2-tientzu@chromium.org>
 <4a2451f9-57d8-2e83-e1d6-f144f37173c0@arm.com>
 <20200714110141.GD16178@lst.de>
 <CALiNf2-9b5LMjv+KCqFJ9oz2FocT6oQ1zVY_MBaFgNG1DQxZ=Q@mail.gmail.com>
 <CALiNf28LVobHKLuXAf7P7Avi6n1oU+tbbFJ55ZPanJuq8Q1Ysg@mail.gmail.com>
In-Reply-To: <CALiNf28LVobHKLuXAf7P7Avi6n1oU+tbbFJ55ZPanJuq8Q1Ysg@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 28 Jul 2020 13:05:44 +0800
X-Gmail-Original-Message-ID: <CALiNf2_rrS8Kv+kps5kxHZaQG5PxxPOvo-ubm7FLCx_ZkouwHQ@mail.gmail.com>
Message-ID: <CALiNf2_rrS8Kv+kps5kxHZaQG5PxxPOvo-ubm7FLCx_ZkouwHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-mapping: Add bounced DMA ops
To: Christoph Hellwig <hch@lst.de>
Cc: Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, Saravana Kannan <saravanak@google.com>,
 suzuki.poulose@arm.com, Robin Murphy <robin.murphy@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, dan.j.williams@intel.com,
 treding@nvidia.com, frowand.list@gmail.com
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

v2 that reuses SWIOTLB here: https://lore.kernel.org/patchwork/cover/1280705/

Thanks,
Claire
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
