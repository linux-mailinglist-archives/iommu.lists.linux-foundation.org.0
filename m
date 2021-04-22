Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB3367C7E
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 10:28:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51538605D9;
	Thu, 22 Apr 2021 08:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebmtBnrM-pP0; Thu, 22 Apr 2021 08:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6A360652;
	Thu, 22 Apr 2021 08:28:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50DFEC000B;
	Thu, 22 Apr 2021 08:28:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D33E1C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 08:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4ACB40145
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVnB6ds8ghRL for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 08:28:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6BA040112
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 08:28:22 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id u8so33148531qtq.12
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
 b=BC2Z7dWmz0+RdT/XQKgh1K4ZkXJWhtVP5f0aeqau16cKa9TxEulrDttNm/OJj6Mh7t
 UyOvttg8zei2cv/nltxGkE0p3bcuSz0WfMCJrDJbCm50bzbAxl15NHtEWBdONDfWW0Bm
 8ytbqnnr0G3b0l9nz1ILNC8uPEz+czqvEKbV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
 b=FGKF4pLFjrJ652UJeMtlMNPuUiBXfsRqex/A+J95P5yt6jQpQrpXcErs1J7jVExvKe
 hB12qSZctJzaHkZzG8cWTnL7RwAI+VqBk8Skq/0rzwMC6v050ZlgV7wSBf6gPc4O1DvC
 ZioftVAJxMZyxG583UU/uKmCJ7phkDLFLzasb72wsweFbA1y340/I4gjhqRCLCE/wir1
 tSPkERU9XvlVCwLuFkmj4N9R8mutxdcWa0OnwNY4ffRasNqdUXBgiZjD/FWkMON7afrA
 EquKYaiA7OXEUICioWLsiqCe5rj7qc1ft2WzxtLWPoN0Uelt6XTXo0U/uijhv5hmq+W/
 PxRQ==
X-Gm-Message-State: AOAM531nHE/qWFsanS2VcMEfEcgtBU8+i2Wx9rb5xNdCSYMf9xUZZM8w
 wOhwLxmM7MmEMyTnmAjac/p9tWjDmJosCQ==
X-Google-Smtp-Source: ABdhPJyMeALcdsmmf5F0T5k4w7W0qyMzZt+pAi2SbYPRxxFwq/JZKxpQtn8ZhdEhW4Ty4L+1w4STQw==
X-Received: by 2002:ac8:4910:: with SMTP id e16mr1976248qtq.370.1619080101435; 
 Thu, 22 Apr 2021 01:28:21 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175])
 by smtp.gmail.com with ESMTPSA id b15sm1978510qtg.82.2021.04.22.01.28.20
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:28:20 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id 66so5956359qkf.2
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 01:28:20 -0700 (PDT)
X-Received: by 2002:a05:6638:34a0:: with SMTP id
 t32mr2134909jal.10.1619079635295; 
 Thu, 22 Apr 2021 01:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 22 Apr 2021 16:20:24 +0800
X-Gmail-Original-Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
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

v5 here: https://lore.kernel.org/patchwork/cover/1416899/ to rebase
onto Christoph's swiotlb cleanups.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
