Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A678282484
	for <lists.iommu@lfdr.de>; Sat,  3 Oct 2020 16:16:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 38B0C85D7D;
	Sat,  3 Oct 2020 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5UvYJNzXc4r; Sat,  3 Oct 2020 14:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC8A885BDF;
	Sat,  3 Oct 2020 14:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABA0AC1AD6;
	Sat,  3 Oct 2020 14:16:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCC71C0051
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B262F87043
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESIEiRMqaLgH for <iommu@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 14:16:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF66187037
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:16:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y2so5431950lfy.10
 for <iommu@lists.linux-foundation.org>; Sat, 03 Oct 2020 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DEerz5rhU/ckz065kjRvk0JGwS2l91T/B4gVGoCe4pI=;
 b=e5oILGSqKqJSAxFLuiDNAy/BpDOlt8bywuJzHxLtjXCKeAPIeJ5iMamAr/cgV+rIhA
 vYi7ANkE+lX7E8EjZ4cisFpSOyhVCAw+45dyOA0F/i+WIye875XxvzHSJzXd+thrzVBu
 HHGzS+8Epj2N1g7bpw4wv8DSO+wsVKY3HpStvCfNOB1QnpUSU/g1OL/yq9Vc1WTgIfbo
 7NsanE+T9b6azfX9fz01xGooT56QueYTE3thM2u/qOewx3GXKuQTy0Y/DzxONOv2tKeb
 9zyAZhOUZkLBlOLRjTOCK4H/rf9+MbsaiAI6bqz2ZKll4IXCudNm9u/mCqJ7Op98JzHc
 lvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DEerz5rhU/ckz065kjRvk0JGwS2l91T/B4gVGoCe4pI=;
 b=cRypzPaQgw5KX0V0fO8AcwiVrkoSTXRWk+U/Oy6HKLxZb1TSvEzLkHZxph4SKmU93O
 N+INxfYqQcF1er2p6BgkNKh07/aAnsng1XoMwFX8ol10uF9AqAyagd0+F9UcXn9wb2Hg
 EZT2pnRp8y6RtPah4U+jOXMfYsIA4BqtFiGV0G6oUJRRvKzcujLNe429gxmjohdpEtMm
 vd6O6kSzkflxDuf9EP2YcXw31/An4/msb2ospl21loSV4PSBc68ArRkKGBDiy1pSWcCr
 BEBltjelksYiE/3DLdB1sBGavKJSSurpDE7zIGrB5gIvzTeKAc4oGLWOFL3m8fmRR/Hb
 ug3Q==
X-Gm-Message-State: AOAM532tGNwr0QH39t4PA0oRp9CfCeHf1uIs1r5M7LwLoDF3dkag3GAu
 gMaL1ELfpe7XpxOxFwNWY5o=
X-Google-Smtp-Source: ABdhPJw014yQfHnsOd2flACWZ4nmC6T+bcz5iCrHEo0QLhleYJSseH0mrTtFGnkREbI3iqojD50OcQ==
X-Received: by 2002:ac2:4148:: with SMTP id c8mr2398321lfi.278.1601734581951; 
 Sat, 03 Oct 2020 07:16:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252]) by smtp.googlemail.com with ESMTPSA id
 l129sm1582110lfd.191.2020.10.03.07.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 07:16:21 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] iommu/tegra-smmu: Add PCI support
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-4-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b028e6a-de6a-6ca1-79c7-5b9c6e86c021@gmail.com>
Date: Sat, 3 Oct 2020 17:16:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-4-nicoleotsuka@gmail.com>
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

MDMuMTAuMjAyMCAwOTo1OSwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gVGhpcyBwYXRjaCBz
aW1wbHkgYWRkcyBzdXBwb3J0IGZvciBQQ0kgZGV2aWNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBO
aWNvbGluIENoZW4gPG5pY29sZW90c3VrYUBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERtaXRy
eSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KClNtYWxsIG5pdDogeW91cnMgcy1iIHRhZyBh
bHdheXMgc2hvdWxkIGJlIHRoZSBsYXN0IGxpbmUgb2YgdGhlIGNvbW1pdAptZXNzYWdlIGJlY2F1
c2UgeW91J3JlICJzaWduaW5nIHVwIiB3b3JkcyB0aGF0IHdlcmUgd3JpdHRlbiBieSB5b3UuCgpU
ZXN0ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0Cmlv
bW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
