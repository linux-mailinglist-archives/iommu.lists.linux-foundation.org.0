Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13984F75EA
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 15:05:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6DD5ACC9;
	Mon, 11 Nov 2019 14:05:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16D5ECAD
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 930C68AB
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:05:23 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id w11so4876963qvu.13
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=content-transfer-encoding:from:mime-version:subject:date:message-id
	:references:cc:in-reply-to:to;
	bh=TUlJCeoF38DKIrVWoIThW1y6VPH1GtKS/JV6B3O9+e8=;
	b=Bgw8Z2dGCYAnlOXhOPDnkhsV3By/I0Z7d7ccWtm1tXqINtmjF4r9crBGOwA312gElP
	ZZgSr9vVjPOGi06MDhGGOwG+eqKCnnjKUrq4pcXW6QB3+zhieOT4jwQrYDhQwtaU/CJz
	bwLos1fDgh9ocIxTS0BsZ5deRjRtihP/UhG66iyMXhsHdIYA2oLAV607Vi+lfk2FZCj6
	uAhu1UKADe4jAOz1KA4HWC+wkggiNw4PqETA5ozAyYyiu0x1NT+B4Q8HtRXyz9MiZxnF
	dCr44BHhu4tzalrK2+gzFzlz2k6eSpj7pvGZeZHdkbauLL6St6r4tcIXIBmh3R+3u6KP
	nJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=TUlJCeoF38DKIrVWoIThW1y6VPH1GtKS/JV6B3O9+e8=;
	b=IUikLJgEbtOo3tcPawtsDvVRXq5VIgawwU7xhk8T/iPymRcr3H79nWIAynVkU1X48I
	LvncMV3tMPiFkTNS8Tji6rT1hIHGFkUo0WsIfeB1btr9JcabaANaHi21fjh8ingTMAG5
	w36XEY6OSF84U34INHnXbUM90qAsNhnmcZsMv7UNrGYNJRzNRYLY4kJs6ZI8+5h6ramQ
	NL/11oWzkDHXGiIZ4XMWpD4dsi+FXxs+32nini7W8Zta+Lt+EONcJgFIznX+iM8R2oq7
	VUbDbm5fhcB82g2RSqwXi9CDWikUypsZSJTeQA5ZNl/jvPDqSWXKfaINgDNGHGSqJt3J
	zNJw==
X-Gm-Message-State: APjAAAWEEa7HfY67NYt20vUvMhcHyXxwXhrm2lUPWf9wHMRG54XGfMqN
	5DjY53wy3DjVHcP6LMKZV2XoPg==
X-Google-Smtp-Source: APXvYqzqhrRm/F68CA5PU/mQDVIRouMaJ2axN9SXyskCosIsXv5cShq2L9eqdvDzzBRD/pc3m0W5VQ==
X-Received: by 2002:a05:6214:90f:: with SMTP id
	dj15mr9905628qvb.224.1573481122495; 
	Mon, 11 Nov 2019 06:05:22 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
	[71.184.117.43]) by smtp.gmail.com with ESMTPSA id
	x11sm9257781qtk.93.2019.11.11.06.05.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 11 Nov 2019 06:05:21 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/1] iommu/vt-d: Add Kconfig option to enable/disable
	scalable mode
Date: Mon, 11 Nov 2019 09:05:20 -0500
Message-Id: <77EC0C76-22C1-4982-8E0A-9AD7223B3410@lca.pw>
References: <f5b8521e-d88d-5439-34e2-f7b54a77c9d3@linux.intel.com>
In-Reply-To: <f5b8521e-d88d-5439-34e2-f7b54a77c9d3@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
X-Mailer: iPhone Mail (17A878)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



> On Nov 11, 2019, at 12:23 AM, Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
> The scalable mode is defined in VT-d 3.0. The scalable mode capability
> could be checked by reading /sys/devices/virtual/iommu/dmar*/intel-
> iommu/ecap. It's currently not friendly for reading. You need to decode
> it according to the spec.

This looks like some perfect information to put in the Kconfig description.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
