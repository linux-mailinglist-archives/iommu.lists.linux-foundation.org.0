Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5E2618E3
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 20:04:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D5BE86B31;
	Tue,  8 Sep 2020 18:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6CR9y7ViLjU; Tue,  8 Sep 2020 18:04:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7BD7F86B04;
	Tue,  8 Sep 2020 18:04:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63616C0859;
	Tue,  8 Sep 2020 18:04:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F4DAC0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30E5A20338
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HaEBFuOGcwk5 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:04:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by silver.osuosl.org (Postfix) with ESMTPS id F38B122FC6
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:04:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k25so125033ljk.0
 for <iommu@lists.linux-foundation.org>; Tue, 08 Sep 2020 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jEj3Cyz6BLHbNpIEqvvmWp+Pn9SwJlYwmj/5uG+ZbOA=;
 b=QhqMJTVlEdukL/UWb9NH/q8ck0QAqkSghth47dlIa6+z38TfeH5UeH7aF/DPIY6N+Y
 RZUR5lu4uSb9PoyE1lmcxqtb9FdzR1Rh/QqGuXr/lf6oUIicrNk/yM5G1l0t3at2Cgao
 tJGoOrFPc2kJP5heYLK08GwdxikRUO/ufIBas2fADjoq6KBwqp7iVLMBIkjyaJS/YOE1
 aGtiUCdVhXDzxRQ3cxbvbcjICM3usQaxMiLHtY0KyOqBJAPYzXguIY6r/Ec7MSggqDtD
 DmtGlJsMExhc94sstGACELYqVDZPj7by4c+NgNKqC0V0hK/lfK4B4I8wS/bwEtwY7TBu
 /xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jEj3Cyz6BLHbNpIEqvvmWp+Pn9SwJlYwmj/5uG+ZbOA=;
 b=Dm21Ep95eNedEpiGsOepHcqvzg31QVreKoTWYgdOlCRxndPSnsn6HJYdnRy/Bn8ka6
 xTZI2YpqDU1OwW7J8IcDMUEaOMnfibOihFItmTx7Hxgmr/XRihnupKFlbgYuYCtKQ5C+
 L65ryWf0zCP3p1DUUkcFrWRMQHSsAokQRH2OW7Gb1V2YWWoe4YEnc9hqPMSophske0K7
 Nmtj9s6zKXoGLJuY8klI6UP+EWWTCUPFyoOiR6v/9fDQYS2b0oE51mwQqbug5DaL5mSB
 J3y7KATKfmLOJI6033aOzpRv5DLhQ6XuQ2VWqrUH8G+z4dwlxCnHzlKlMmFt7Dnjtwfy
 MxgQ==
X-Gm-Message-State: AOAM531h+mcqUPKK1Jm74wcw2fjH3vAyIERBVJgg7hfVbYjF5WK5Yxjp
 NUfEWfeuM13zflBlmGNpdEs=
X-Google-Smtp-Source: ABdhPJxOUh/DrhDJ0sLHODDZNX/AG6pD3ZL1wq5ajq4aTkSAV8ndeDN1OI1ZCYVq9+MPf2vTkw+8bg==
X-Received: by 2002:a2e:9047:: with SMTP id n7mr14193403ljg.125.1599588259222; 
 Tue, 08 Sep 2020 11:04:19 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:4400:1ee0:403c:d08c:bf15:55e0])
 by smtp.gmail.com with ESMTPSA id
 h17sm132955ljj.4.2020.09.08.11.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:04:18 -0700 (PDT)
Subject: Re: [PATCH 04/12] dma-mapping: fix DMA_OPS dependencies
To: Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-5-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <8404208b-7276-914e-e4da-e65a907a5e9b@gmail.com>
Date: Tue, 8 Sep 2020 21:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-5-hch@lst.de>
Content-Language: en-US
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

Hello!

On 9/8/20 7:47 PM, Christoph Hellwig wrote:

> Driver that select DMA_OPS need to depend on HAS_DMA support to
> work.  The vop driver was missing that dependency, so add it, and also
> add a nother depends in DMA_OPS itself.  That won't fix the issue due

   Another? :-)

> to how the Kconfig dependencies work, but at least produce a warning
> about unmet dependencies.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
