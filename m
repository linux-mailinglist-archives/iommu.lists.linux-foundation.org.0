Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82627DFF2
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:10:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2533F2042E;
	Wed, 30 Sep 2020 05:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV2edAgcjrPQ; Wed, 30 Sep 2020 05:10:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E2ED62041B;
	Wed, 30 Sep 2020 05:10:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE875C0051;
	Wed, 30 Sep 2020 05:10:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DA2DC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A06C85F75
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiRS-Xsiuq4Z for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:10:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C996485DF6
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:10:38 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u8so582241lff.1
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7RnkfJsbUh7g8qsHmACv/an5jdB38y9vYVUYMMT0u78=;
 b=BUhHy378W4exgOXZlV4eCaAU4SbYB7fpjBC3E/n9eviTkbV85pXEayvBbdfpsed3na
 1WX8w0QvYZdoWN8diheM4S6lo9mvzBHsoL7AtQEqEIqyR97gt1XBL8Mqj2TJVqmru6Br
 ngOM51RhA0HTZsqiSrJoluAyfUWQzxwU2YJKwSm8sxIvlTu5sA8JWUgmWYHBBOMmggMi
 IJcfMfLJw6Uaf1AmhAQ3Rpc2DPTPrZCugGDbPvzA7jE9SzRgPggfdPKgNfefp8seiAtQ
 AhGKMecbSPT+qcM6STPVW52YbLZMvfGi03edB2shNz/YulVehZaxZgBp62hsQVzpJCxg
 93Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7RnkfJsbUh7g8qsHmACv/an5jdB38y9vYVUYMMT0u78=;
 b=oqKiwEzkVG0gPlLzqXo26p4oBYCr4i3grgfpogShF2Mgj04ZlxJ3cFtzNyUWsj9A0S
 ZpIQbOAoFqMzoaYKCuZvsINCkNQTooYerp9rBMJ3boy8PtQkN3+Pp598Q/F9d3AHJOti
 I+7kaWtz8j5iobyM56oWx4qWpmzv41V2DTz6OixAlKNV/p/vHd2EOEg+JWhKliVBzqSx
 tTvhLbQB8fI5VuMPPK7eFWrDHQRIPlu+o3uqwHcl9LVlvOWMgoKXG7URR5Y7/myxm4L0
 THyWCq7i5LIuKqBwMhrCboqMLew+u2fhpeoceRtBNHtslJgjQlVdHPAOcSB2qEUfKiFX
 YExw==
X-Gm-Message-State: AOAM533OmshT12WQz/xUFJpNyHaanOUgx3L4cHY/Gj825N7mrmUCBpt4
 /nqYb+gBMSSA7Ek1nt5PHqCSIWCg8hc=
X-Google-Smtp-Source: ABdhPJzrza9LR+W/N7Worn8hDU5s/IFqvxn2I9BcBC/SgGIU106E75sWouaottg9OJzsXQeoWV38Fg==
X-Received: by 2002:a05:6512:36cd:: with SMTP id
 e13mr257448lfs.165.1601442636882; 
 Tue, 29 Sep 2020 22:10:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 78sm55706lfi.81.2020.09.29.22.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:10:36 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org, krzk@kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a91f07c-bc27-7607-915c-e98a7a0c4b24@gmail.com>
Date: Wed, 30 Sep 2020 08:10:35 +0300
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

MzAuMDkuMjAyMCAwMzozMCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gIHZvaWQgdGVncmFf
c21tdV9yZW1vdmUoc3RydWN0IHRlZ3JhX3NtbXUgKnNtbXUpCj4gIHsKPiArCWJ1c19zZXRfaW9t
bXUoJnBsYXRmb3JtX2J1c190eXBlLCBOVUxMKTsKCldoeSBvbmx5IHBsYXRmb3JtX2J1cz8gSXMg
dGhpcyByZWFsbHkgbmVlZGVkIGF0IGFsbD8KCj4gIAlpb21tdV9kZXZpY2VfdW5yZWdpc3Rlcigm
c21tdS0+aW9tbXUpOwo+ICAJaW9tbXVfZGV2aWNlX3N5c2ZzX3JlbW92ZSgmc21tdS0+aW9tbXUp
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
