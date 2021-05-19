Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AC3895FE
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 21:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68CF0405EE;
	Wed, 19 May 2021 19:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TWG6_auXY6Y; Wed, 19 May 2021 19:00:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3F940477;
	Wed, 19 May 2021 19:00:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27449C0001;
	Wed, 19 May 2021 19:00:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC29AC0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 19:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB49140153
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 19:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tr5ZNmqrcW-1 for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 19:00:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2313C4013D
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 19:00:11 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso3918841pjb.5
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
 b=TKwRdnu4+Sp1YkQdeC//ZaZe5gFK1OBbc6fiWqiSSxtaemxo8tsS6cyyKonvkggi45
 AkmXBkDwPjivTxMkW/6u87n74jtYP0vz5yoiKDWAMEYfh+QJdqbXNMoLboJ95qsaB+Sz
 evhXDQC1zkb888kY45tuzx3cOkf8aRLE0tysepxM3+bqwCkk54R2Q027+/7CcS0ORj65
 6mx2ltgEPNZ+I2TPARzQB2NU/eRypDG4kJedWyyBabBiqBkk+XEYxHjO+wV8NZqkj5Xb
 Wiz3FWUYSWAt8nsw3SelNmNlkX4sXNF7RuifyB1BY+CyHdw4EnNC9bgPveVhRQQuluiO
 dhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
 b=LDgkERnTfn88gKr2TGLt9wMYmyWaujVe1ziS+HwwSwMGFRKMjs39CJDnX36qwJBDE9
 /R98qdZSjsgiRWSmANk5O9wBvAmKbRDodYzF4XEGguHL7d00koHVUIAgauL15P8/VdAE
 tJIIPJjZ9zU7yD7uSx/qXAK+tOqUOe+kKZAgNMS+Nakoh6BOabgQxGSgukrGiPJGLr1x
 +BVYagoa298ESjoT3IM6aRgc5T//FJaj+FT4rlfF0JcBFf24gqkwE4+MQHHo+KOv8b9y
 lUNHl0XydMr4eVW7juqtdTFIGBgIjqmoQiXtn32+rlhEmNyWDOoBWLa70ApH8JAyvMHe
 Iglg==
X-Gm-Message-State: AOAM5328La75iaZmGdAkkCxEWy5nX0kxtmEf8BWgs8SF3Orf359xMzeT
 XYUzwUwXdir4iR8bgljnnUA=
X-Google-Smtp-Source: ABdhPJzSFi5vywroBZ7tSNHRQs1V9GPTz+dOSZzWMkXvwkz7CoWyRh73gQHWXYp/m+DT8rff9721jw==
X-Received: by 2002:a17:903:10a:b029:f4:109c:dc08 with SMTP id
 y10-20020a170903010ab02900f4109cdc08mr1027246plc.10.1621450810600; 
 Wed, 19 May 2021 12:00:10 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y26sm89076pge.94.2021.05.19.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:00:09 -0700 (PDT)
Subject: Re: [PATCH v7 03/15] swiotlb: Add DMA_RESTRICTED_POOL
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-4-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d9975ce8-7ae9-2ece-a1c5-a16d0aed8143@gmail.com>
Date: Wed, 19 May 2021 12:00:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-4-tientzu@chromium.org>
Content-Language: en-US
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
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



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
