Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E9E1EB4EB
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 07:10:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E26D85EB8;
	Tue,  2 Jun 2020 05:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nw5BXEcO_O2v; Tue,  2 Jun 2020 05:10:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78B9D85D9B;
	Tue,  2 Jun 2020 05:10:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE6CC0176;
	Tue,  2 Jun 2020 05:10:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE8EC0176
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 29B8B87D0E
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33gfip7occwr for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:10:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A888287CC9
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:10:05 +0000 (UTC)
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 479011FABFC121EBD0EF;
 Tue,  2 Jun 2020 13:10:03 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.10]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Tue, 2 Jun 2020 13:09:57 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] driver core: platform: expose numa_node to users in sysfs
Thread-Topic: [PATCH] driver core: platform: expose numa_node to users in sysfs
Thread-Index: AQHWOIpUwdvGGcJ/+UCxidEm0PhHvqjEM/4AgACJWmCAAAdA0A==
Date: Tue, 2 Jun 2020 05:09:57 +0000
Message-ID: <B926444035E5E2439431908E3842AFD24D8F9E@DGGEMI525-MBS.china.huawei.com>
References: <20200602030139.73012-1-song.bao.hua@hisilicon.com>
 <20200602042340.GA2130884@kroah.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.14]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "rafael@kernel.org" <rafael@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

> >
> > Platform devices are NUMA?  That's crazy, and feels like a total abuse
> > of platform devices and drivers that really should belong on a "real"
> > bus.
> 
> I am not sure if it is an abuse of platform device. But smmu is a platform
> device,
> drivers/iommu/arm-smmu-v3.c is a platform driver.
> In a typical ARM server, there are maybe multiple SMMU devices which can
> support
> IO virtual address and page tables for other devices on PCI-like busses.
> Each different SMMU device might be close to different NUMA node. There is
> really a hardware topology.
> 
> If you have multiple CPU packages in a NUMA server, some platform devices
> might
> Belong to CPU0, some other might belong to CPU1.

Those devices are populated by acpi_iort for an ARM server:

drivers/acpi/arm64/iort.c:

static const struct iort_dev_config iort_arm_smmu_v3_cfg __initconst = {
        .name = "arm-smmu-v3",
        .dev_dma_configure = arm_smmu_v3_dma_configure,
        .dev_count_resources = arm_smmu_v3_count_resources,
        .dev_init_resources = arm_smmu_v3_init_resources,
        .dev_set_proximity = arm_smmu_v3_set_proximity,
};

void __init acpi_iort_init(void)
{
        acpi_status status;

        status = acpi_get_table(ACPI_SIG_IORT, 0, &iort_table);
        ...
        iort_check_id_count_workaround(iort_table);
        iort_init_platform_devices();
}

static void __init iort_init_platform_devices(void)
{
        ...

        for (i = 0; i < iort->node_count; i++) {
                if (iort_node >= iort_end) {
                        pr_err("iort node pointer overflows, bad table\n");
                        return;
                }

                iort_enable_acs(iort_node);

                ops = iort_get_dev_cfg(iort_node);
                if (ops) {
                        fwnode = acpi_alloc_fwnode_static();
                        if (!fwnode)
                                return;

                        iort_set_fwnode(iort_node, fwnode);

                        ret = iort_add_platform_device(iort_node, ops);
                        if (ret) {
                                iort_delete_fwnode(iort_node);
                                acpi_free_fwnode_static(fwnode);
                                return;
                        }
                }

                ...
        }
...
}

NUMA node is got from ACPI:

static int  __init arm_smmu_v3_set_proximity(struct device *dev,
                                              struct acpi_iort_node *node)
{
        struct acpi_iort_smmu_v3 *smmu;

        smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
        if (smmu->flags & ACPI_IORT_SMMU_V3_PXM_VALID) {
                int dev_node = acpi_map_pxm_to_node(smmu->pxm);

                ...

                set_dev_node(dev, dev_node);
                ...
        }
        return 0;
}

Barry

                                                    
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
