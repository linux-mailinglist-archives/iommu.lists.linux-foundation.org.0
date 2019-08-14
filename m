Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A69368D712
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 17:17:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E3B3D3E;
	Wed, 14 Aug 2019 15:17:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5914DC59
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:50:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C881587E
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:50:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id i63so4721151wmg.4
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=/DXlUZnAnppcVmvRaCvG45NAF6K209fxQvIeSZzOmy4=;
	b=pcnVgWDPpVIKvEGcoQm5OxaoBVqYZbMOQiqkZ3wTAZr8Y6ocDyeakMLA8Im1Y+g99D
	POTgttsWlFnHPGAOzmL9x63nQingz9nYI4tmdXIrqRiCxn+kPG3T16a2nvIYG8GQ2Vzs
	Wce7Jnayh7CiIlLHBB2wEP03uzF21zbs288aBwspAfbTH7jE/zAGLwIiABldEZ0t2MFl
	7g+sqkueLUfkGGO7etvOXVSscsbkaSLTKp6TuYRkN4eneuKFf/g2q7u1xTmiXRL4QSi9
	08axMg8aBPXjCpcOkD6x6gdVVXu3E7WHEH7t0kz1SSsDjvHpa4CY59KwF9g2UEt0zSR3
	HS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=/DXlUZnAnppcVmvRaCvG45NAF6K209fxQvIeSZzOmy4=;
	b=dAXjRG2KmqgIaCUG9cbRryvljGb94O5lst04G4Wm87VbVK6o27/psKfvmQzAPX9X2F
	mNFhPC69nMh4tY78k4p3ffcIhc+O+FAHo7/PAU/qCBS7QEbbpTwX6NTBWOoiZ8xqqtdF
	EBzhqpK1kMaMlSETilo0XfMQn7jy8WFDdmt1IRhdIdEVAqpr/cT9fY+RAEhhAhU9w3xY
	+FSxS6G0Ugj3EeLDGnldhqJgVpcAuS9VigS71YqArZe70a+LTZaToAnRYyDT9fVWHCId
	yDEynJ4ukTAb5aNmGJXw/ZzkVYm31/Fz+Kms2ia4NXg3nFvw4zdNqHoWopFIckncNsws
	3lJg==
X-Gm-Message-State: APjAAAWFXRAl3vGHW4chm3miz3YlmfPO4u3nY63Sq5VSigkr8OG2Ei9i
	a1awCQ5LauEMhbl9JRPIs9c=
X-Google-Smtp-Source: APXvYqzoe9W3VA/sAzPxBxLK/CY1XdtfCqCC8uiIxtC44+YlxqrDtNJOaniUqy9vvtFN3+P4u+PPwA==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr9053044wmi.48.1565794236524; 
	Wed, 14 Aug 2019 07:50:36 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
	by smtp.googlemail.com with ESMTPSA id
	t198sm7911434wmt.39.2019.08.14.07.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Aug 2019 07:50:35 -0700 (PDT)
Date: Wed, 14 Aug 2019 16:50:33 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
	nouveau ?
Message-ID: <20190814145033.GA11190@Red>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 14 Aug 2019 15:17:38 +0000
Cc: nouveau@lists.freedesktop.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hello

Since lot of release (at least since 4.19), I hit the following error message:
DMA-API: cacheline tracking ENOMEM, dma-debug disabled

After hitting that, I try to check who is creating so many DMA mapping and see:
cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
      6 ahci
    257 e1000e
      6 ehci-pci
   5891 nouveau
     24 uhci_hcd

Does nouveau having this high number of DMA mapping is normal ?

Regards
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
