Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BE27DFEA
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:10:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B5B5186FBB;
	Wed, 30 Sep 2020 05:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SjH4u15FhKR; Wed, 30 Sep 2020 05:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FC9D871B4;
	Wed, 30 Sep 2020 05:10:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3040AC1AD6;
	Wed, 30 Sep 2020 05:10:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1553FC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBE0C2041D
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTCrGqsagzh8 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 3118E2041B
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:04 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b12so545166lfp.9
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cEH+zGuhb7boZPnK+5qwlskD7dzNXbs2N7hqt0FYXtI=;
 b=JEKFiD9IhMc0d2BR62xEDLkwxPUNZ5O5AdjXzgRfQBoaNRDPyAaOzVSksh5qzthbOn
 cYaL2EEnInhh9d9qCI/VzTHM1UAFrtLeelC6pPjdHatdMhlXKjkbIwO7k0//RsZkRsjS
 423U++/3789kQEX1LWZcA5NE/DgIeZJI+acgQJ9GYvKAG4XiCcvjr/EDmHXnhenbvhwx
 tuH8F9P/YTm19nRrmsNVTDY6ylX+zAyu5FzeFSHMQ0xbRSvwdp3IfcWatk/brX3Rh49h
 ptCq5FurX26gGHPZHjo9Rvr1ERKApIQju9F9KmmigUZ9gY3kmkYyPPHkqXtglU0jw/ww
 +Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cEH+zGuhb7boZPnK+5qwlskD7dzNXbs2N7hqt0FYXtI=;
 b=IXYww6tVmwOu8wvbvluoojpJGVbkl50DclXlO3HfW82mt7xzx14Gn2KXc39PqDjABJ
 V4ug5YWsiW1fEGgsXf/KCniEMJhQgj8YrKx/l49rlulK/TGJRlxwbhoLIqvx2fuS0fFO
 iHM+DlAuzsbL1Z7AstGRczvI1RB/zH8c833E1XZT3SxubnlY1HgLukAK7JyggCdDVBVH
 eDLx6wZZtMx1gE73S/vtCluzuSCZ62S3jYoI679sOL3h9GcdVc2ytOXkmTGeqmJzHGeg
 3uETHWsWAl2FZEAtRZTmf6SWiCJRfryd/CCBYycP6WKPcARPed/sI3vXS79Z0mRkIAlt
 59pg==
X-Gm-Message-State: AOAM531T6fzAO3HG4s7+gagSRL1Mk4mybuph5lCehOJN92EDl0RZg1KX
 gKVFS09gCOs9pll+iN/nMB4=
X-Google-Smtp-Source: ABdhPJyOrfcyT8AJjKsE9UZTICu54D13qTLp0F9P1YPzBCvcB7eAm/HnfeYg1e2/Xa+QzTIeCRVeNA==
X-Received: by 2002:a19:8bc2:: with SMTP id n185mr211884lfd.211.1601442601966; 
 Tue, 29 Sep 2020 22:10:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id v196sm54763lfa.96.2020.09.29.22.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:10:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org, krzk@kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
Date: Wed, 30 Sep 2020 08:10:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-4-nicoleotsuka@gmail.com>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

MzAuMDkuMjAyMCAwMzozMCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Ci4uLgo+ICsjaWZkZWYg
Q09ORklHX1BDSQo+ICsJaWYgKCFpb21tdV9wcmVzZW50KCZwY2lfYnVzX3R5cGUpKSB7CgpDb3Vs
ZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2h5IHRoaXMgY2hlY2sgaXMgbmVlZGVkPwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QK
aW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
