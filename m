Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59127DFFA
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:12:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2F2A02041B;
	Wed, 30 Sep 2020 05:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHCvsefyDTDV; Wed, 30 Sep 2020 05:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C44F20430;
	Wed, 30 Sep 2020 05:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 608C6C0051;
	Wed, 30 Sep 2020 05:12:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F3D5C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E30085C67
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfSjbEPXGnEm for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:12:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 611E18506B
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:12:13 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d15so546137lfq.11
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WnFP8lnfHJgOPmmswyB1oqxtTdFe5yGHV9kG5nGP1I4=;
 b=bZ2qFS69/vWFPYql8daXf4N+6wro+5xZYyVsqEffhxC47wWH+8i0zGZyc6e8bskZU+
 rOgj+WMdVjB3jb61M29438T3GD2zcBc2MY6mxg3XHjD/wuJYOVpl5N6fUyY6SLGJoNW3
 fYhyhcNWCV+QEXo5mQWxgI/0lp8PI2g3dLcHy20/UEQP7zVVoYlr9k4+ipbFxlViJesF
 c1khISIBWAqPPQQDzhe6Ka4eGmvSclZQFK4wHHEGdk+MAlg/FSmoDJiRVJHseZRi7iS9
 OFcH+2YCmYZKJD1pMMeyfMK+CFNJs+wYm1raLJXbxLxwJ7KkCU4umuodpn9eYCymeNe2
 eefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WnFP8lnfHJgOPmmswyB1oqxtTdFe5yGHV9kG5nGP1I4=;
 b=MMIPwsTwJASllB0b3rImo3iKNMB+UqM8u2mofMBPBqp8e+NkRhy9I2J5Bn/++2iYq/
 TFNGT9qWkAbApHZxKnXWZjAQwah50qsegeBB2R9RMoGwhbL0CH/vGLz8HwYsTgx3kw2Y
 QRedr4rh0kydLg5CQ334WQNXusPW0vzI0X1s0SRa2Iqx2QEtJ4rB/9u5gib4ppjK9JOm
 q2JhschZAjKjr9H0H2hNAczDhQg9FtAxtopXUjqkHZQ2qItoAgXrZx0VHViaMfVSXjAH
 84c7kl0sYjY9i6wf24BWEEEdJCjJnAdVQBU/BvSbBu2BlccpN2DkSZMu6yiX+laYGwNi
 czKw==
X-Gm-Message-State: AOAM533A3ubGasMphNjk2MOBLD0ATzLS+qFBLG8/pgG9yCV/us6V0hHg
 jfrPlBzNBLVfXQz07p1Q188=
X-Google-Smtp-Source: ABdhPJwj3hG5D4s4X9cvpm66sPqDZ0OHtsu9PITFwy9p2nU9IKOvdUk/0r+Ie5zIY3pz0VFv8jfcKw==
X-Received: by 2002:a19:e54:: with SMTP id 81mr280338lfo.178.1601442731681;
 Tue, 29 Sep 2020 22:12:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id n8sm49566lji.1.2020.09.29.22.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:12:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org, krzk@kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
Date: Wed, 30 Sep 2020 08:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-2-nicoleotsuka@gmail.com>
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

MzAuMDkuMjAyMCAwMzozMCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Ci4uLgo+ICBpbnQgdGVn
cmFfbWNfd3JpdGVfZW1lbV9jb25maWd1cmF0aW9uKHN0cnVjdCB0ZWdyYV9tYyAqbWMsIHVuc2ln
bmVkIGxvbmcgcmF0ZSk7Cj4gIHVuc2lnbmVkIGludCB0ZWdyYV9tY19nZXRfZW1lbV9kZXZpY2Vf
Y291bnQoc3RydWN0IHRlZ3JhX21jICptYyk7Cj4gK3N0cnVjdCB0ZWdyYV9tYyAqdGVncmFfZ2V0
X21lbW9yeV9jb250cm9sbGVyKHZvaWQpOwo+ICAKPiAgI2VuZGlmIC8qIF9fU09DX1RFR1JBX01D
X0hfXyAqLwo+IAoKVGhpcyB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIHRlZ3JhMjAtZGV2ZnJlcSBk
cml2ZXIsIHlvdSBzaG91bGQgY2hhbmdlIGl0CmFzIHdlbGwuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9pb21tdQ==
