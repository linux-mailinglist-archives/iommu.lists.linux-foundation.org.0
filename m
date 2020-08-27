Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B225456F
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 14:54:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 752C7876EB;
	Thu, 27 Aug 2020 12:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPIMaL5T4whj; Thu, 27 Aug 2020 12:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3374876F9;
	Thu, 27 Aug 2020 12:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9BDDC0051;
	Thu, 27 Aug 2020 12:54:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED309C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D58A185FAC
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3STxf03RyUJ for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 12:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0712186073
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 12:54:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id s13so5069363wmh.4
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=FGT1CbGRN8nWIZimQQJFHaFlgGbXUWXcohmF6aYnzTMEIdoXLV8ASHcjH/rftf8dPu
 05h7ynqky+tK0sVnESIUNMOkwDJXKaIKOOjfk8ZzK2aS6ItFzfPK1RiS8Sgq9gCPkksa
 s87z1TYPj+YUb/w6uaLEL+ETfgmlzhXCU10ucGJlzNXsBINUdbYoCrfyflOTHYw+cbz4
 RAdiDof8rxMnyZ5hwply2FrDERb1PY3A2wl1RdJOsOW1zwqi8pXPitwO0zzOFjipVey5
 oUPQnIgnx+nqlo3zwpUr7dRtVO/mC+2RV5+VHT1jDZZ+PWuU7gSvtmMNjL2CWO/kpKhp
 IGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=pr9f3f8N6pKY6M1lDp7bRAgGZ99V7HXTeU8Wxaaw8bjr8Ylup13fAcnwsAYKWkf8gE
 A1vaAhyCfi0oa6Gc8DwrgmKMzqkHD6v5caI2JJilGF5GeKdUQ6wfSFgJERHiXR7rmVS0
 t7azEdK2McxDDYctV2eWkdAR2xEVYtP1A6/e3F9Ud4rWvcySGKCP0z9vFmXE8Gasc+HG
 Zqb+29x99iG6Eh/xKkBpXimQGj36XAmcXFXyL8IhnZ61ARmg0jLV7HyUgtn0gkoEiIMn
 G7oxOBA/NVkvhQzhpzgNk22BS/D+AQG4ELZM8ld0+v2SPZs5bcf7LrTkO50iiwjK8Cxj
 g5wg==
X-Gm-Message-State: AOAM530S/80NY+7u6mUxTx/tfs5x+VnXBaDdjWBBMFcNHLX8PPS7TQGX
 pSeoZOPPCjcE0N/n7eH4qCysVnooTvXbmrE0
X-Google-Smtp-Source: ABdhPJwqZV7pk1FvOSkguIjKJvFkFK+Tun3miq523wTMnXd9BGquVzYW29lvsrXbzl2PtJrmqLojuA==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr3074513wmc.100.1598532878977; 
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id m11sm5436719wrn.11.2020.08.27.05.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Subject: Re: Aw: [PATCH 00/18] Convert arch/arm to use iommu-dma
To: Frank Wunderlich <frank-w@public-files.de>,
 Robin Murphy <robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d54f5d47-63aa-d07e-3875-6acce69073f3@gmail.com>
Date: Thu, 27 Aug 2020 14:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
Content-Language: en-US
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 will@kernel.org, hch@lst.de, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, agross@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
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



On 27/08/2020 14:31, Frank Wunderlich wrote:
> Tested full series on bananapi r2 (mt7623/mt2701, 5.9-rc1 + hdmi-patches), works so far fbcon+x without issues
> 
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> 

Thanks for testing.

Robin this is especially relevant for:
[PATCH 09/18] iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support

Regards,
Matthias
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
