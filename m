Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0E2831A7
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 10:14:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 150992000E;
	Mon,  5 Oct 2020 08:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id As2gB9kJoKnF; Mon,  5 Oct 2020 08:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F0C7120025;
	Mon,  5 Oct 2020 08:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2B30C0051;
	Mon,  5 Oct 2020 08:14:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF00C0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 08:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 180068700A
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 08:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZ2QQfJVTgIW for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 08:14:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D906486FD5
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 08:14:30 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b12so9751153lfp.9
 for <iommu@lists.linux-foundation.org>; Mon, 05 Oct 2020 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5XN9V3BvyveRl6mO6Y9d7mYUzGE03RcVJt79XhJ7IQ=;
 b=KJF9tlE8rf+w1UQmusIv1x7UZEK1DkFtHevrVRo772QLFCCOk5Wcd3cpAMhbRW2oR2
 jowUHm4Ktm8vyMkgH/I5glKWfEcIbqzoaluMw7LnzSFosIoUBD+Dzsj6ICKmeJ2Lck72
 xILnA7r2Bwo0gIJg/bThuTorUqyRDXdb59CBQwBx/ORhomckfMbHTX5EBmk2+Wqxz4Ub
 aUu9RhcGQYW5agpuVGc+Q9kx0KNqpleaw2YycJCUEVxtCJGRhlw4TufvTFwUxb7Zvr62
 68AooIdDyRtFyQYIDKQLTd43GOaSzI0QNgHD1OGiIW9szRzL88BjQz3D9lzNXeE63rKs
 1yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5XN9V3BvyveRl6mO6Y9d7mYUzGE03RcVJt79XhJ7IQ=;
 b=RYQ+AsWh/jKr2wsx0ptv1XOldGO6IL6gAcHUzjepO3cefTGdMjE/Ff0TxLTRDZdi5I
 dWz21Dv8ejOVyVTWWJTmPNNh1w12jHzTTA1bbvmcH/3WHKx/61U6myRucUUgcS4BoGJC
 QqbCWu2aDfly9h4EBl7noTnY8jmjbdLHfa1D8XL2gfzEa6Nu3o6RgjTpH0q4PWko/Wu6
 8CtZ4VV3OmJJX4UXQKfxo9h1dWxqLi/kS22qN9/cV1ENvXErE8c7iTRHf3rEeY8i3m7q
 jG+B++OFR4tJfGAAmK7Bgwgk85jJAqCm790di257EJ0RRKPzCjJYPlE6BtzPWdawBiY2
 nmMA==
X-Gm-Message-State: AOAM531YZV3/aJvmA5ZuYJhIMK/ICEGn5jNnygOq4pOQPy9vbA2nvioK
 dT/+DtnDnZUwDgel1ad+PMg=
X-Google-Smtp-Source: ABdhPJzemIzFCplJkXyIIB0ijx9JVIz3iQi1oUYyAHp4PAE0N6jP7Kqk1pDCb29mXjAqgLfFHYGpZQ==
X-Received: by 2002:a19:c355:: with SMTP id t82mr5617098lff.251.1601885668987; 
 Mon, 05 Oct 2020 01:14:28 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id q24sm2605472lfo.149.2020.10.05.01.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 01:14:28 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia> <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
 <20201005071338.GA425362@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b1a3ee6-d556-4172-3314-0c852d3c6916@gmail.com>
Date: Mon, 5 Oct 2020 11:14:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005071338.GA425362@ulmo>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org
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

MDUuMTAuMjAyMCAxMDoxMywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4gSGF2ZSB5
b3UgYWxzbyBzZWVuIHRoYXQgc3VuNTBpLWlvbW11IGRvZXMgbG9vayB1cCB0aGUgU01NVSBmcm9t
IGEKPiBwaGFuZGxlIHVzaW5nIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoKT8gU28gSSB0aGluayB5
b3UndmUgc2hvd24geW91cnNlbGYKPiB0aGF0IGV2ZW4gIm1vZGVybiIgZHJpdmVycyBhdm9pZCBn
bG9iYWwgcG9pbnRlcnMgYW5kIGxvb2sgdXAgdmlhCj4gcGhhbmRsZS4KCkkgaGF2ZSBubyBwcm9i
bGVtIHdpdGggdGhlIGxvb2t1cCBieSBwaGFuZGxlIGFuZCBJJ20gYWxsIGZvciBpdC4gSXQncwpu
b3cgYXBwYXJlbnQgdG8gbWUgdGhhdCB5b3UgY29tcGxldGVseSBtaXNzZWQgbXkgcG9pbnQsIGJ1
dCB0aGF0IHNob3VsZApiZSBteSBmYXVsdCB0aGF0IEkgaGF2ZW4ndCBjb252ZXllZCBpdCBwcm9w
ZXJseSBmcm9tIHRoZSBzdGFydC4gSSBqdXN0CndhbnRlZCB0byBhdm9pZCB0aGUgaW5jb21wYXRp
YmxlIERUIGNoYW5nZXMgd2hpY2ggY291bGQgYnJlYWsgb2xkZXIgRFRzCisgSSBzaW1wbHkgd2Fu
dGVkIHRvIGltcHJvdmUgdGhlIG9sZGVyIGNvZGUgd2l0aG91dCBpbnRyb2R1Y2luZyBuZXcKZmVh
dHVyZXMsIHRoYXQncyBpdC4KCkFueXdheXMsIGFmdGVyIHlvdXJzIGNvbW1lbnRzIEkgc3RhcnRl
ZCB0byBsb29rIGF0IGhvdyB0aGUgaW50ZXJjb25uZWN0CnBhdGNoZXMgY291bGQgYmUgaW1wcm92
ZWQgYW5kIGZvdW5kIG5ldyB0aGluZ3MsIGxpa2UgdGhhdCBPUFBzIG5vdwpzdXBwb3J0IElDQyBh
bmQgdGhhdCBFTUMgaGFzIGEgd29ya2luZyBFTUNfU1RBVCwgSSBhbHNvIGRpc2NvdmVyZWQKc3lz
Y29uIGFuZCBzaW1wbGUtbWZkLiBUaGlzIG1lYW5zIHRoYXQgd2Ugd29uJ3QgbmVlZCB0aGUgZ2xv
YmFsIHBvaW50ZXJzCmF0IGFsbCBuZWl0aGVyIGZvciBTTU1VLCBub3IgZm9yIGludGVyY29ubmVj
dCwgbm9yIGZvciBFTUMgZHJpdmVycyA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
