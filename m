Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AACA12A4D4F
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 18:42:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F9D287126;
	Tue,  3 Nov 2020 17:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd0Wt3gAVDXn; Tue,  3 Nov 2020 17:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AF648744B;
	Tue,  3 Nov 2020 17:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A666C0051;
	Tue,  3 Nov 2020 17:42:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8D12C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D3533863E2
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYuRJqQZp9T0 for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 17:42:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AF0FE863DC
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:42:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id b19so8911225pld.0
 for <iommu@lists.linux-foundation.org>; Tue, 03 Nov 2020 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rsl6lmX6v9O2Z0QU9skbwTzUfbl2hHwSPUBkrUuyNCg=;
 b=cKgU/Gqe/ADQRGSSLoA+Hi1WdKWJVAS0bw9sAo3A7juygkGRAEwAO6/lVdIVcMr/lp
 tzUQ3K9GNGEXmW7YOQ7u/uVkhJjSc7ld47ie2rGKgMtmao07L9Zo4DP1Z37gK/FmMNvA
 2WuDZ+KOrtv3GTVmeAw2jxKZVU6LcGnPgWloevfWKKqRjd+ZI0jPKDcoNSVkeFb0yUwm
 E6manMKPEnUhkWZmrc78aTn2d0kGrbpZ5JfuY3eYcLqUrdzoKmZJ72a9UKvEl7BsS0NH
 CA0V2PoAfVmt7s6fkWOEoBLHwjEI4U0Tru/WfS8OUk5ADzmV8FeGCqvjCeOJrVi6lLJC
 8hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rsl6lmX6v9O2Z0QU9skbwTzUfbl2hHwSPUBkrUuyNCg=;
 b=W4NT5stzIfWSZKNL2oz7sqfbk8RnvKxGh/b2R5aWKIc57IKnFItWIuTL2DQTc5a9PK
 eJN29JXVgW1gthE2WA9FfMoH2YEGpNyEo7RyPNHrIRqeH8JP5xFqAV4C5KHrPeejulkJ
 /hujTnD3NBK0oIK4xMgf8j1I7eKCb1UXYjlSTg9aDgjiCZoFe58O9HORVdJi3y0CCEOF
 0zWu4PtZxwoEEdaYR72iapQg251sD0YLrvVxCOED2Y4Vi2r0ddtpsn7F6wmps+WesEKl
 2Nobn0gJJUDIdmLmyUnWMpw7y8ZLRZB9uY3GxJj21C084EozMe4Jv9Jevsee/suxGDkf
 tMmg==
X-Gm-Message-State: AOAM532ddGHAC5Fjc50xP0pBrZ1phdw7Fz4vd9gAkwTKp+pzRQD0OtfZ
 DACVldiFJH84xi7CMtEkfgI=
X-Google-Smtp-Source: ABdhPJx21kD40fBue0zqwQCVJRyuZ5D4dRTQMSl7iEnZz7fibbcE4gACjoasQRUSstfq8J3CU+josw==
X-Received: by 2002:a17:902:9697:b029:d6:c3f6:8dcf with SMTP id
 n23-20020a1709029697b02900d6c3f68dcfmr12777394plp.8.1604425345253; 
 Tue, 03 Nov 2020 09:42:25 -0800 (PST)
Received: from [10.230.28.234] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a18sm18711595pfg.54.2020.11.03.09.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 09:42:24 -0800 (PST)
Subject: Re: can we switch bmips to the generic dma ranges code
To: Christoph Hellwig <hch@lst.de>, cernekee@gmail.com, f.fainelli@gmail.com, 
 james.quinlan@broadcom.com
References: <20201103101545.GA20851@lst.de>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b7a673ca-db14-5b67-c1f4-068ed2b49bed@gmail.com>
Date: Tue, 3 Nov 2020 09:42:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103101545.GA20851@lst.de>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mips@vger.kernel.org
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



On 11/3/2020 2:15 AM, Christoph Hellwig wrote:
> Hi Florian and others,
> 
> now that the generic DMA ranges code landed, can we switch bmips over
> to it instead of duplicating the logic?

This should be fine, I cannot easily test the 338x chips, however as far
as PCIe goes, I believe Jim may have some older patches he can dig up
for testing.
-- 
Florian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
