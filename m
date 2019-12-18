Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 76583124C93
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 17:07:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB39C87B72;
	Wed, 18 Dec 2019 16:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWdhYgf9HBid; Wed, 18 Dec 2019 16:06:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB59C87B08;
	Wed, 18 Dec 2019 16:06:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A48E3C1D87;
	Wed, 18 Dec 2019 16:06:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20C67C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1D65286C26
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGMUcehEbm_V for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 16:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B2B0D86BC4
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:06:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q10so2869120wrm.11
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ilGmQzgVpyz5+GgzhiMi4TnzxPgEeCNgmk38TMF+kZE=;
 b=C1i8TT0BKaZyqPij7EJiWtjjPH+4RB1V0a/wUUSe/JhD9Oslbx/1Q6XBpUW4q/UXah
 aoe7twq2cCcWk0bOOJ8Gb45nCWzluMIaHz3zLYW62oA0JAIGE4LCdpdOofh0hHYbNncr
 7MRGFnhVHQ4QYKCyBPZDcJ+yuntrIOsJELzFkUuNbHJ5GH97ieyD4Hx/gV1FrVok8xPE
 jNC4iIRl7+jgHUADTihavmD3bgyz/hMLa6NPMD4z0NlctNZH0ccJcgj2fU8QyAbECLao
 R/3/iPqI0xBufIyVNwBG7j7oOgv1rd4/DaFeC9pHElsyRmZy3qcm5xpPdim14xbF4VWO
 YKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ilGmQzgVpyz5+GgzhiMi4TnzxPgEeCNgmk38TMF+kZE=;
 b=esAFArn/BrQKbkDYIkzIMe6BH8r/SBr37c9NQl5egltpM9NzeXaGwP2O2B1NdrBtTR
 lY/hclTHcZ2vqiyydSKaA7Q8q+a75MzUtkg6qKuzImQkh1c2XmNZp3W+X3pW5dJbj3Sv
 GN1NO/NuNUs4FZt81srYsCn/b/J0rulWyVrn9i3FeutdEEhCnG7+FM/WQ0ZxU1DqdT81
 s/+G3Qlreeab/szd7Rp79AsUAtzZ5C/mhtO0MK7/aeDbOZ5Kz8iJJawGzTN3+WSevg3L
 eykraToQSbbPB/7pqkZCRih8RUIMp3uSyccSoBXga8DN92SaFjltp84BkV0Y0k71mk/X
 hytA==
X-Gm-Message-State: APjAAAUjHTUrLx+HFjO0Ff5/qb18suOrwOVPVqfiSUJ6gFl+VvW2us9c
 uWy0UfEPrs0OEW5xKRFvgUStRg==
X-Google-Smtp-Source: APXvYqzlJfnzBPNvhgPh9GCf337cLxDV4nJ7SDFk/WvYc0UpuKM/kTPeUg6Rln8M6dK6UBAz2n6nYw==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr3435991wru.297.1576685214969; 
 Wed, 18 Dec 2019 08:06:54 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id d14sm3236857wru.9.2019.12.18.08.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 08:06:54 -0800 (PST)
Date: Wed, 18 Dec 2019 17:06:49 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 03/13] iommu/arm-smmu-v3: Support platform SSID
Message-ID: <20191218160649.GE2371701@myrica>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
 <20191209180514.272727-4-jean-philippe@linaro.org>
 <06c57de4-cfca-f95f-ac06-ab6f49a028a3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06c57de4-cfca-f95f-ac06-ab6f49a028a3@redhat.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, robin.murphy@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, guohanjun@huawei.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 lenb@kernel.org
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

On Wed, Dec 18, 2019 at 11:17:40AM +0100, Auger Eric wrote:
> Hi Jean,
> 
> On 12/9/19 7:05 PM, Jean-Philippe Brucker wrote:
> > For platform devices that support SubstreamID (SSID), firmware provides
> > the number of supported SSID bits. Restrict it to what the SMMU supports
> > and cache it into master->ssid_bits, which will also be used for PCI
> > PASID.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> the title of the patch does not really explain what it actually does. At
> this stage we are far from supporting SSIDs ;-) Same for 04?

Alright I'll make this "Parse PASID devicetree property of platform
devices" and "Parse SSID property of named component node"

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
