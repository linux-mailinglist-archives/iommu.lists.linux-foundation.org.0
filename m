Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B32814EF
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 16:22:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7631286739;
	Fri,  2 Oct 2020 14:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AKj0yNJ1p78; Fri,  2 Oct 2020 14:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DFED8671E;
	Fri,  2 Oct 2020 14:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A590C0051;
	Fri,  2 Oct 2020 14:22:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62439C0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F0DF86C5F
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSDucoItbAJk for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 14:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 75A3686C5D
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:38 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k25so1334154ljg.9
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nS6D06SellKTicjxHhmhtpKieUSKN6mejQrgwpSnzL0=;
 b=TrXScAbvDO/Fq03RnNsWYApCVrGPHZ0N2nL/LLtxWLi3gs1TpRCO/9u13T+CI4Kepw
 +fkPfvT/99RJjNmbE3OntoNESfrO0xgqpapvBRR+FmuFhm5byqU2aepTEBdvyNt2HqDQ
 jxtIXclDiY9DE/B3c5GbDElMQAWY0OfhFx9EY3cYZf1VxMKNOq//zm+cF3xFjZ+RwNhw
 60N7Xz3E13r8BW81d8conz6kHc2sepAa/xGGgeDM08A43iPH4tqkHuwMlSd5HMC97WpS
 rCFdNmw0RRh/R8pCa7g8roftsGDjp3nQ6BJZAQNmimeSFieuhEE6y/Fkq68/gNjyJQ0x
 TifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nS6D06SellKTicjxHhmhtpKieUSKN6mejQrgwpSnzL0=;
 b=MByKMJeZI18+Hb6m0gsM5PO4CLA07cKvhJvLpfzQ3eBKal3bbSR3SWwLU8IM7WYH8G
 nz/nc4jceMdEDJlG0fiDjIzVzuGRP/70EF0aviEvJHJ4M5HngQd8tmK2e10+X/UIk8ti
 kNasUUS5v9VGRVJH1UWPxoi31CN3htt0CiN7HJT5eFRYE7ww2XSXg6+YwsYUW4T61TEH
 Pl8hsClgXrtm3/6YPZ7n0cRlB+fmKJccl/aO0R6k/I9KPFZYvfuCBOqvXI8XuOywG/ps
 JZQoWNapzldkl6Ui37iPGzUct0JRuePBIebCgwFEYKKVGQ1DU4kavQK0F8qjwpvQBKhV
 2Iww==
X-Gm-Message-State: AOAM530/H7hq0MUL+sBiMdy8JwBk8whct6U0NGGWpmzn0opIFV9Iq3UE
 efuNF+HZuYb28HdNaq3u3yY=
X-Google-Smtp-Source: ABdhPJyhBMjEGBAq5xouAYGzblqYPkzK2WLhb1IsDLQtl3LpHK9oxX6DW1N5YJ3yUIBYXdOaQyh4hQ==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr770307lji.204.1601648556727; 
 Fri, 02 Oct 2020 07:22:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id 10sm316118lfq.64.2020.10.02.07.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:22:36 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
Date: Fri, 2 Oct 2020 17:22:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-3-nicoleotsuka@gmail.com>
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

MDIuMTAuMjAyMCAwOTowOCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gLXN0YXRpYyB2b2lk
IHRlZ3JhX3NtbXVfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQo+IC17Cj4gLQlk
ZXZfaW9tbXVfcHJpdl9zZXQoZGV2LCBOVUxMKTsKPiAtfQo+ICtzdGF0aWMgdm9pZCB0ZWdyYV9z
bW11X3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikge30KClBsZWFzZSBrZWVwIHRo
ZSBicmFjZXMgYXMtaXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21t
dQ==
