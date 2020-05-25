Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8F1E14CA
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 21:34:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32A088757F;
	Mon, 25 May 2020 19:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upcxFarnoy5s; Mon, 25 May 2020 19:34:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B001287482;
	Mon, 25 May 2020 19:34:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C19DC016F;
	Mon, 25 May 2020 19:34:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 517B3C016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45D298757F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 19:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id le1gfwjQUHol for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 19:34:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B97D87482
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 19:34:51 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z13so12192537ljn.7
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A4jmYZdU5ozBMAXAqmyk44sUjgV6hYrwfu6KlXmyOS8=;
 b=ftDR4Ed6/4/UwzMezVOfDErK3teieIpd8y1f/Lb84PRLBTlN2umIzX2SO8oKktyN9e
 JxqTIRfCcwtNJ4LX6lpD5nFObH6vKi8me1zNJN2kX0e/Ds+WWtXr18qRSpTMPB0N3sFB
 G/5DZBl3ODACPw5Kn8rNvy5XQJ+dXJV4nbAAH60KeUSkUsb0/uzkDK1xlRgvrrY5bpxl
 93EZYzGzrqMt273yWJxW3MjIEed6niJeHEs7XgHwqirnTBQ0SbEQkOut+XXIIdb1X09J
 yArmCxgNS8p9Zw4vCLki32tJeRME3xZ9o7Q9tp2OASJD2psnlzoldExpvY3lyJ4ER2pW
 AK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A4jmYZdU5ozBMAXAqmyk44sUjgV6hYrwfu6KlXmyOS8=;
 b=BFf4uge+whuNc6BDNjrOfZn506Vknja8IU/uMgVOAZfbLU2LFSoaVCUYC44n8uxQx4
 sNAKPfUdM+yYqfKnnFkx+yxLyfZnNrhrpeOcAz+MDj6AHqW/j0PpqgekZAVbWmyTjbJr
 lQRKpYEWly2BtPXSadInZdxYLE7l5Muryq7bm6ZVWNZMI0s2IGqPj9ocDLX4gL7aBjqX
 ZfQQ3VTXwdXVomsSw9YRQH1aJ0o7U8GZ0PcequwSatB9kGqkj65ej/JoVPqPEIrvwb2R
 HBqJtNFparKCPIlxzGfAipzO7b5AzrXgI4zL8yRZL1BGDhSrRrvs7TU2F+vj3ulo0KRb
 EKQQ==
X-Gm-Message-State: AOAM530EV4obzhIr44zDbOsYLD08fpjLmJ6Yx32zoYqEVd/kPxR32Vfj
 ev8U8oR296Uo0zZzge+ynWA=
X-Google-Smtp-Source: ABdhPJxMGuM6N/f4LC792sPrhgWYvy5nLWumLbUsFmsrQl5S04rMvyYu8zXeOAyUN4d60W1isrrMrg==
X-Received: by 2002:a2e:701a:: with SMTP id l26mr15350495ljc.50.1590435289168; 
 Mon, 25 May 2020 12:34:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.googlemail.com with ESMTPSA id j9sm5339418lfe.24.2020.05.25.12.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 12:34:48 -0700 (PDT)
Subject: Re: [PATCH v1] iommu/tegra-smmu: Add missing locks around mapping
 operations
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200524183755.3774-1-digetx@gmail.com>
 <20200525083556.GA2382769@ulmo>
 <ffa2f98f-1809-e4f0-009e-d06dcde0ed49@gmail.com>
 <20200525122016.GB2393266@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c6819193-6200-b7a6-57e4-c763d1a7129e@gmail.com>
Date: Mon, 25 May 2020 22:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525122016.GB2393266@ulmo>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>
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

MjUuMDUuMjAyMCAxNToyMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4gRG8gd2Ug
aGF2ZSBhIGdvb2Qgd2F5IHRvIGZpbmQgb3V0IGhvdyBiYWQgZXhhY3RseSB0aGUgY29udGVudGlv
biB3b3VsZAo+IGJlIHdoZW4gdXNpbmcgYSBtdXRleD8KCkknbSBub3cgaGF2aW5nIGEgc2Vjb25k
IHRob3VnaHQgYWJvdXQgaXQuIFdlIGRvbid0IG5lZWQgdG8gY2FyZSBhYm91dAp0aGF0IHNjZW5h
cmlvIGF0IGFsbCBiZWNhdXNlIGl0J3MgYSBzb2Z0d2FyZS1kZXNpZ24gZGVmZWN0IG9mIHRoZQp1
cHN0cmVhbSBIb3N0MXggZHJpdmVyIHRoYXQgaXQgbWFwcyBnYXRoZXJzIGR5bmFtaWNhbGx5LiBU
aGUgZGVmZWN0IGNhbgpiZSBmaXhlZCBhbmQgdGhlbiB0aGUgcG90ZW50aWFsIHByb2JsZW0gd29u
J3QgZXhpc3QgYXQgYWxsLgoKTmVpdGhlciBvZiB0aGUgZHJpdmVycyB0aGF0IGFyZSB1c2luZyBU
ZWdyYSBTTU1VIG5lZWQgdGhlIElPTU1VIG1hcHBpbmcKb3BlcmF0aW9ucyB0byBiZSBwZXJmb3Jt
ZWQgdW5kZXIgc3BpbmxvY2ssIHNvIG11dGV4IHdpbGwgYmUgZ29vZCBhCnZhcmlhbnQuIEknbGwg
bWFrZSBhIHYyIHdpdGggYSBtdXRleCwgdGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGlu
ZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
